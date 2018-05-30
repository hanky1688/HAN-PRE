package com.hanky.base.utils;

import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.IOException;
import java.math.BigDecimal;

import static java.util.Objects.isNull;

/**
 */
@Data
@EqualsAndHashCode(callSuper = true)
public final class BigDecimalTypeAdapter extends TypeAdapter<BigDecimal> {
    /**
     * Writes one JSON value (an array, object, string, number, boolean or null)
     * for {@code value}.
     *
     * @param out
     * @param value the Java object to write. May be null.
     */
    @Override
    public void write(JsonWriter out, BigDecimal value) throws IOException {
        out.value(isNull(value) ? null : value.toPlainString());
    }

    /**
     * Reads one JSON value (an array, object, string, number, boolean or null)
     * and converts it to a Java object. Returns the converted object.
     *
     * @param in
     * @return the converted Java object. May be null.
     */
    @Override
    public BigDecimal read(JsonReader in) throws IOException {
        if (in.peek() == JsonToken.NULL) {
            in.nextNull();
            return null;
        }

        return new BigDecimal(in.nextString());
    }
}
