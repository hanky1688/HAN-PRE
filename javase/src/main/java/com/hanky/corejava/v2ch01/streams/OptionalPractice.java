package com.hanky.corejava.v2ch01.streams;

import java.util.Optional;

public class OptionalPractice {
    public static void main(String[] args) {

        //create optional

        try {
            Optional<String> optional = Optional.of(null);
        } catch (Exception e) {
            System.out.println("is null:" + e);
        }

        Optional<String> optional = Optional.ofNullable(null);

        System.out.println(optional.isPresent());
        System.out.println("square 4:"+squareRoot(4.0));
        System.out.println(inverse(4.0).flatMap(OptionalPractice::squareRoot));

        Optional<Double> result = Optional.of(-4.0).flatMap(OptionalPractice::inverse).flatMap(OptionalPractice::squareRoot);
        System.out.println(result);
        System.out.println(getValueString(result));

    }

    public static Optional<Double> inverse(Double x) {
        return x == 0 ? Optional.empty() : Optional.of(1 / x);
    }

    public static Optional<Double> squareRoot(Double x) {
        return x < 0 ? Optional.empty() : Optional.of(Math.sqrt(x));
    }

    public static <T> String getValueString(Optional<T> optional){
        if (optional.isPresent()){
            return optional.get().toString();
        }
        return "empty";
    }



}
