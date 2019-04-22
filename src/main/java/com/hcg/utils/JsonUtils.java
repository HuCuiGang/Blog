package com.hcg.utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.util.List;

public class JsonUtils {
    //定义jackson对象
    private static final ObjectMapper MAPPER = new ObjectMapper();

    /**
     * 将对象转成Json字符串。
     * @param data
     * @return
     */

    public static String objectToJson(Object data){
        String string =null;
        try {
            string=MAPPER.writeValueAsString(data);
            return string;
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 将json结果集转化为对象
     * @param jsonData
     * @param beanType
     * @param <T>
     * @return
     */
    public static <T> T jsonToPojo(String jsonData,Class<T> beanType){
        try {
            T t = MAPPER.readValue(jsonData,beanType);
            return t;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 将json数据转换成pojo对象list
     * @param jsonData
     * @param beanType
     * @param <T>
     * @return
     */
    public static <T>List<T> jsonToList(String jsonData,Class<T> beanType){
        JavaType javaType=MAPPER.getTypeFactory().constructCollectionType(List.class,beanType);
        try {
            List<T> list = MAPPER.readValue(jsonData,javaType);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

}
