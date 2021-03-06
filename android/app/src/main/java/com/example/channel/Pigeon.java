// Autogenerated from Pigeon (v1.0.8), do not edit directly.
// See also: https://pub.dev/packages/pigeon

package com.example.channel;

import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.StandardMessageCodec;
import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

/** Generated class from Pigeon. */
@SuppressWarnings({"unused", "unchecked", "CodeBlock2Expr", "RedundantSuppression"})
public class Pigeon {

  public enum RequsetType {
    sayhello(0),
    getbattery(1);

    private int index;
    private RequsetType(final int index) {
      this.index = index;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class SearchRequest {
    private RequsetType query;
    public RequsetType getQuery() { return query; }
    public void setQuery(RequsetType setterArg) { this.query = setterArg; }

    Map<String, Object> toMap() {
      Map<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("query", query.index);
      return toMapResult;
    }
    static SearchRequest fromMap(Map<String, Object> map) {
      SearchRequest fromMapResult = new SearchRequest();
      Object query = map.get("query");
      fromMapResult.query = RequsetType.values()[(int)query];
      return fromMapResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class SearchReply {
    private String result;
    public String getResult() { return result; }
    public void setResult(String setterArg) { this.result = setterArg; }

    Map<String, Object> toMap() {
      Map<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("result", result);
      return toMapResult;
    }
    static SearchReply fromMap(Map<String, Object> map) {
      SearchReply fromMapResult = new SearchReply();
      Object result = map.get("result");
      fromMapResult.result = (String)result;
      return fromMapResult;
    }
  }
  private static class SearchApiCodec extends StandardMessageCodec {
    public static final SearchApiCodec INSTANCE = new SearchApiCodec();
    private SearchApiCodec() {}
    @Override
    protected Object readValueOfType(byte type, ByteBuffer buffer) {
      switch (type) {
        case (byte)128:         
          return SearchReply.fromMap((Map<String, Object>) readValue(buffer));
        
        case (byte)129:         
          return SearchRequest.fromMap((Map<String, Object>) readValue(buffer));
        
        default:        
          return super.readValueOfType(type, buffer);
        
      }
    }
    @Override
    protected void writeValue(ByteArrayOutputStream stream, Object value)     {
      if (value instanceof SearchReply) {
        stream.write(128);
        writeValue(stream, ((SearchReply) value).toMap());
      } else 
      if (value instanceof SearchRequest) {
        stream.write(129);
        writeValue(stream, ((SearchRequest) value).toMap());
      } else 
{
        super.writeValue(stream, value);
      }
    }
  }

  /** Generated interface from Pigeon that represents a handler of messages from Flutter.*/
  public interface SearchApi {
    SearchReply search(SearchRequest request);

    /** The codec used by SearchApi. */
    static MessageCodec<Object> getCodec() {
      return SearchApiCodec.INSTANCE;
    }

    /** Sets up an instance of `SearchApi` to handle messages through the `binaryMessenger`. */
    static void setup(BinaryMessenger binaryMessenger, SearchApi api) {
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.SearchApi.search", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              ArrayList<Object> args = (ArrayList<Object>)message;
              SearchRequest requestArg = (SearchRequest)args.get(0);
              if (requestArg == null) {
                throw new NullPointerException("requestArg unexpectedly null.");
              }
              SearchReply output = api.search(requestArg);
              wrapped.put("result", output);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
    }
  }
  private static Map<String, Object> wrapError(Throwable exception) {
    Map<String, Object> errorMap = new HashMap<>();
    errorMap.put("message", exception.toString());
    errorMap.put("code", exception.getClass().getSimpleName());
    errorMap.put("details", null);
    return errorMap;
  }
}
