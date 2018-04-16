package com.hanky.base.utils;

import com.google.gson.*;
import com.jayway.jsonpath.Configuration;
import com.jayway.jsonpath.DocumentContext;
import com.jayway.jsonpath.JsonPath;
import com.jayway.jsonpath.Option;
import com.jayway.jsonpath.spi.json.GsonJsonProvider;
import com.jayway.jsonpath.spi.json.JsonProvider;
import com.jayway.jsonpath.spi.mapper.GsonMappingProvider;
import com.jayway.jsonpath.spi.mapper.MappingProvider;
import org.apache.commons.lang3.StringUtils;

import java.lang.reflect.Type;
import java.math.BigDecimal;
import java.util.EnumSet;
import java.util.Set;

public final class Json {
    static {
        Configuration.setDefaults(new Configuration.Defaults() {

            private final JsonProvider jsonProvider = new GsonJsonProvider();
            private final MappingProvider mappingProvider = new GsonMappingProvider();

            /**
             * Returns the default {@link JsonProvider}
             *
             * @return default json provider
             */
            @Override
            public JsonProvider jsonProvider() {
                return jsonProvider;
            }

            /**
             * Returns default setOptions
             *
             * @return setOptions
             */
            @Override
            public Set<Option> options() {
                return EnumSet.noneOf(Option.class);
            }

            /**
             * Returns the default {@link MappingProvider}
             *
             * @return default mapping provider
             */
            @Override
            public MappingProvider mappingProvider() {
                return mappingProvider;
            }
        });
    }

    private final static Gson gson = new GsonBuilder()
            .registerTypeAdapter(BigDecimal.class, new BigDecimalTypeAdapter())
            .disableHtmlEscaping()
            .create();

    public static DocumentContext parse(String json) {
        return JsonPath.parse(json);
    }

    public static String toJson(Object src) {
        return gson.toJson(src);
    }

    public static <T> T fromJson(String json, Class<T> classOfT) throws JsonSyntaxException {
        return gson.fromJson(json, classOfT);
    }

    public static <T> T fromJson(String json, Type classOfT) throws JsonSyntaxException {
        return gson.fromJson(json, classOfT);
    }

    public static String toStatJson(Object src, String code, long cost) {
        Object target;
        if (src != null) {
            target = src;
        } else {
            target = new Object();
        }
        JsonElement jsonElement = gson.toJsonTree(target);
        jsonElement.getAsJsonObject().addProperty("CODE", code);
        jsonElement.getAsJsonObject().addProperty("COST_TIME", cost);
        return gson.toJson(jsonElement);
    }


    public static String jsonToStatJson(String src, String code, Long cost) {
        if (StringUtils.isEmpty(src)) {
            return "";
        }
        JsonParser parse = new JsonParser();
        JsonElement jsonElement = parse.parse(src);
        jsonElement.getAsJsonObject().addProperty("CODE", code);
        jsonElement.getAsJsonObject().addProperty("COST_TIME", cost);
        return gson.toJson(jsonElement);
    }
}
