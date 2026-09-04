# 可覆盖的基础镜像版本
ARG LITELLM_VERSION=v1.99.1
FROM ghcr.io/berriai/litellm:${LITELLM_VERSION}

# UI 语言，构建时传入
ARG LITELLM_UI_LANG=zh-CN

# 从构建上下文复制实时拉取的上游 i18n 文件
COPY zhtw/ /zhtw/

# 执行补丁脚本并清理临时文件
RUN LITELLM_UI_LANG="${LITELLM_UI_LANG}" python /zhtw/patch_ui.py && \
    rm -rf /zhtw
