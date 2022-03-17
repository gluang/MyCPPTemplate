PROJECT_NAME=main
# find 中的 -o 选项表示“或”
FILES_TO_FORMAT ?= $(shell find . -name '*.cpp' -o -name '*.h')
# 将 opencv 中的动态库存放到 libs 中
LIBS ?=$(shell find /home/gluang/project/cpp/third_party/opencv -name "*.so*")

all: help

## build: 编译程序
build:
	@/bin/bash script.sh build
# @mkdir -p build && rm -rf build/*
# @cd build && cmake .. && make
.PHONY: build


## run: 运行二进制文件
run:
	@/bin/bash script.sh run ${PROJECT_NAME}
# @cd build && ./main
.PHONY: run


## test: 运行测试
test:
	@cd build && make test
.PHONY: test

## clean: 清除中间文件
clean:
	@rm -rf -v build/* bin/*
.PHONY: clean


## format: 格式化代码
format:
	@clang-format -i -style=file ${FILES_TO_FORMAT}
.PHONY: format
# @clang-format -i -style=file main.cpp
# @clang-format -i -style=file src/*.cpp include/*.h main.cpp


## libs: 添加程序运行时需要链接的动态库
.PHONY: libs
libs:
	@mkdir -p libs
	@cp ${LIBS} libs


# ## build-image: 构建镜像
# build-image:
# 	@docker build -t $(PROJECT_NAME)-image .
# .PHONY: build-image

# ## build-container: 创建容器
# build-container:
# 	@docker run -it --rm $(PROJECT_NAME)-image /bin/bash
# .PHONY: build-container

# ## rm-image: 删除镜像
# rm-image:
# 	@docker rmi -f $(PROJECT_NAME)-image
# .PHONY: rm-image


## help: 打印命令帮助信息
help:
	@echo "Usage:"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'
.PHONY: help

