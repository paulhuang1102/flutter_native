JAVA_PACKAGE=com.example.channel
JAVA_PATH=android/app/src/main/java/com/example/channel/Pigeon.java

flutter pub run pigeon \
  --input pigeons/message.dart \
  --dart_out lib/pigeon.dart \
  --objc_header_out ios/Runner/Pigeon.h \
  --objc_source_out ios/Runner/Pigeon.m \
  --objc_prefix FLT \
  --java_out ${JAVA_PATH} \
  --java_package ${JAVA_PACKAGE}

echo "Pigeon Script Success!"