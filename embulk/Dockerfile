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
	      embulk-input-jdbc embulk-output-jdbc \
	      embulk-filter-column embulk-filter-row embulk-filter-distinct \
	      embulk-filter-icu4j embulk-filter-gsub embulk-filter-ruby_proc \
	      embulk-filter-unpivot embulk-parser-none
WORKDIR /work

ENTRYPOINT ["java", "-jar", "/opt/embulk/embulk"]
