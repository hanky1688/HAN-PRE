package com.hanky.corejava.v2ch01.collecting;

import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class CollectingPractice {

    public static Stream<Person> people() {
        return Stream.of(new Person(1001, "Peter"), new Person(1002, "Paul"),
                new Person(1003, "Mary"), new Person(1001, "Black"));
    }

    public static void main(String[] args) {
        //final Map<Integer, String> collect = people().collect(Collectors.toMap(Person::getId, Person::getName));
        //java.lang.IllegalStateException: Duplicate key Peter

        final Map<Integer, String> collect =
                people().collect(Collectors.toMap(Person::getId, Person::getName,
                        (existingValue, newValue) -> existingValue+"|"+newValue));
        System.out.println(collect);

        Stream<Locale> locales = Stream.of(Locale.getAvailableLocales());
        //groupingByTest(locales);

        Map<Boolean, List<Locale>> englishAndOtherLocales = locales.collect(
                Collectors.partitioningBy(l -> l.getLanguage().equals("en")));
        List<Locale> englishLocales = englishAndOtherLocales.get(true);
        System.out.println(englishAndOtherLocales);
        System.out.println(englishLocales);

    }

    private static void groupingByTest(Stream<Locale> locales) {
        Map<String, List<Locale>> countryToLocales = locales.collect(
                Collectors.groupingBy(Locale::getCountry));
        System.out.println(countryToLocales);
        List<Locale> swissLocales = countryToLocales.get("CH");
        System.out.println(swissLocales);
        // Yields locales [it_CH, de_CH, fr_CH]
    }

}
