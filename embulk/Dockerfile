FROM openjdk:8-slim

ENV LANG=C.UTF-8 PATH_TO_EMBULK=/opt/embulk
ENV PATH=${PATH_TO_EMBULK}:${PATH}

RUN apt-get update && apt-get install -y curl \
    && mkdir -p ${PATH_TO_EMBULK} \
    && curl --create-dirs -o ${PATH_TO_EMBULK}/embulk -L "https://github.com/embulk/embulk/releases/download/v0.9.24/embulk-0.9.24.jar" \
    && chmod +x ${PATH_TO_EMBULK}/embulk \
    && embulk gem install \
              embulk-input-postgresql embulk-output-postgresql \
	      embulk-input-s3 embulk-output-s3 \
	      embulk-filter-column  embulk-filter-distinct embulk-filter-unpivot
WORKDIR /work

#ENTRYPOINT ["/bin/sh", "-c", "java -jar ${PATH_TO_EMBULK}/embulk"]
ENTRYPOINT ["java", "-jar", "/opt/embulk/embulk"]
