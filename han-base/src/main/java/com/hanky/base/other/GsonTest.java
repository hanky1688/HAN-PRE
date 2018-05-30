package com.hanky.base.other;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.hanky.base.utils.Json;

import java.util.HashMap;

public class GsonTest {
    public static void main(String[] args) {
        Gson gson = new Gson();
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("name", "mafly");
        map.put("age", "18");
        map.put("sex", null);

        String jsonString = gson.toJson(map);
        System.out.println(jsonString);  //{"name":"mafly","age":"18"}

        final GsonBuilder gsonBuilder = new GsonBuilder();
        String jsonString1 = gsonBuilder.serializeNulls().create().toJson(map);
        System.out.println(jsonString1);
        System.out.println(gsonBuilder.create().toJson(map));
        System.out.println(Json.toJson(map));
    }
}
