// Autogenerated from Pigeon (v1.0.8), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import "Pigeon.h"
#import <Flutter/Flutter.h>

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSDictionary<NSString *, id> *wrapResult(id result, FlutterError *error) {
  NSDictionary *errorDict = (NSDictionary *)[NSNull null];
  if (error) {
    errorDict = @{
        @"code": (error.code ? error.code : [NSNull null]),
        @"message": (error.message ? error.message : [NSNull null]),
        @"details": (error.details ? error.details : [NSNull null]),
        };
  }
  return @{
      @"result": (result ? result : [NSNull null]),
      @"error": errorDict,
      };
}

@interface FLTSearchRequest ()
+ (FLTSearchRequest *)fromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end
@interface FLTSearchReply ()
+ (FLTSearchReply *)fromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end

@implementation FLTSearchRequest
+ (FLTSearchRequest *)fromMap:(NSDictionary *)dict {
  FLTSearchRequest *result = [[FLTSearchRequest alloc] init];
  result.query = [dict[@"query"] integerValue];
  return result;
}
- (NSDictionary *)toMap {
  return [NSDictionary dictionaryWithObjectsAndKeys:@(self.query), @"query", nil];
}
@end

@implementation FLTSearchReply
+ (FLTSearchReply *)fromMap:(NSDictionary *)dict {
  FLTSearchReply *result = [[FLTSearchReply alloc] init];
  result.result = dict[@"result"];
  if ((NSNull *)result.result == [NSNull null]) {
    result.result = nil;
  }
  return result;
}
- (NSDictionary *)toMap {
  return [NSDictionary dictionaryWithObjectsAndKeys:(self.result ? self.result : [NSNull null]), @"result", nil];
}
@end

@interface FLTSearchApiCodecReader : FlutterStandardReader
@end
@implementation FLTSearchApiCodecReader
- (nullable id)readValueOfType:(UInt8)type 
{
  switch (type) {
    case 128:     
      return [FLTSearchReply fromMap:[self readValue]];
    
    case 129:     
      return [FLTSearchRequest fromMap:[self readValue]];
    
    default:    
      return [super readValueOfType:type];
    
  }
}
@end

@interface FLTSearchApiCodecWriter : FlutterStandardWriter
@end
@implementation FLTSearchApiCodecWriter
- (void)writeValue:(id)value 
{
  if ([value isKindOfClass:[FLTSearchReply class]]) {
    [self writeByte:128];
    [self writeValue:[value toMap]];
  } else 
  if ([value isKindOfClass:[FLTSearchRequest class]]) {
    [self writeByte:129];
    [self writeValue:[value toMap]];
  } else 
{
    [super writeValue:value];
  }
}
@end

@interface FLTSearchApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation FLTSearchApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[FLTSearchApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[FLTSearchApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *FLTSearchApiGetCodec() {
  static dispatch_once_t s_pred = 0;
  static FlutterStandardMessageCodec *s_sharedObject = nil;
  dispatch_once(&s_pred, ^{
    FLTSearchApiCodecReaderWriter *readerWriter = [[FLTSearchApiCodecReaderWriter alloc] init];
    s_sharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return s_sharedObject;
}


void FLTSearchApiSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<FLTSearchApi> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.SearchApi.search"
        binaryMessenger:binaryMessenger
        codec:FLTSearchApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(searchRequest:error:)], @"FLTSearchApi api (%@) doesn't respond to @selector(searchRequest:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        FLTSearchRequest *arg_request = args[0];
        FlutterError *error;
        FLTSearchReply *output = [api searchRequest:arg_request error:&error];
        callback(wrapResult(output, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
}
