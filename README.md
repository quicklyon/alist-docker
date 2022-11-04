<!-- 该文档是模板生成，手动修改的内容会被覆盖，详情参见：https://github.com/quicklyon/template-toolkit -->
# QuickOn AList 应用镜像

[![GitHub Workflow Status](https://github.com/quicklyon/alist-docker/actions/workflows/docker.yml/badge.svg)](https://github.com/quicklyon/alist-docker/actions/workflows/docker.yml)
![Docker Pulls](https://img.shields.io/docker/pulls/easysoft/alist?style=flat-square)
![Docker Image Size](https://img.shields.io/docker/image-size/easysoft/alist?style=flat-square)
![GitHub tag](https://img.shields.io/github/v/tag/quicklyon/alist-docker?style=flat-square)

> 申明: 该软件镜像是由QuickOn打包。在发行中提及的各自商标由各自的公司或个人所有，使用它们并不意味着任何从属关系。

## 快速参考

- 通过 [渠成软件百宝箱](https://www.qucheng.com/app-install/alist-install-<number>.html) 一键安装 **AList**
- [Dockerfile 源码](https://github.com/quicklyon/alist-docker)
- [AList 源码](https://github.com/alist-org/alist)
- [AList 官网](https://alist.nn.ci/)

## 一、关于 AList

<!-- 这里写应用的【介绍信息】 -->

[Alist](https://alist.nn.ci/zh/) 一个支持多种存储的文件列表程序，使用 Gin 和 Solidjs。
  
![screenshots](https://raw.githubusercontent.com/quicklyon/alist-docker/main/.template/alist_screenshot.png)

AList官网：[https://alist.nn.ci/](https://alist.nn.ci/)

<!-- 这里写应用的【附加信息】 -->

### 1.1 特性

- 使用简单: AList 从一开始就设计为易于安装，并且可以在所有平台上使用
- 使用简单: AList 支持多个存储提供商，包括本地存储、阿里云盘、OneDrive、Google Drive 等，且易于拓展
- 支持 WebDAV: AList 支持所有 WebDAV 存储，这是一种用于访问文件的标准
- 黑暗模式: 自由切换明暗模式
- 受保护的路由: 为特定路径添加密码保护和身份验证
- 文件预览: 支持视频、音频、文档、PDF、图片预览等，甚至支持 ipa 安装
- 打包下载: 使用浏览器的 stream api 支持打包下载，无需使用服务器
- 更多新功能: 包括文本编辑器、README/HTML 渲染、文件永久链接、Cloudflare Workers 代理等

## 二、支持的版本(Tag)

由于版本比较多,这里只列出最新的5个版本,更详细的版本列表请参考:[可用版本列表](https://hub.docker.com/r/easysoft/alist/tags/)

<!-- 这里是镜像的【Tag】信息，通过命令维护，详情参考：https://github.com/quicklyon/template-toolkit -->
- [latest](https://github.com/alist-org/alist/releases)
- [3.3.0-20221104](https://github.com/alist-org/alist/releases/tag/v3.3.0)

## 三、获取镜像

推荐从 [Docker Hub Registry](https://hub.docker.com/r/easysoft/alist) 拉取我们构建好的官方Docker镜像。

```bash
docker pull easysoft/alist:latest
```

如需使用指定的版本,可以拉取一个包含版本标签的镜像,在Docker Hub仓库中查看 [可用版本列表](https://hub.docker.com/r/easysoft/alist/tags/)

```bash
docker pull easysoft/alist:[TAG]
```

## 四、持久化数据

如果你删除容器，所有的数据都将被删除，下次运行镜像时会重新初始化数据。为了避免数据丢失，你应该为容器提供一个挂在卷，这样可以将数据进行持久化存储。

为了数据持久化，你应该挂载持久化目录：

- /data 持久化数据

如果挂载的目录为空，首次启动会自动初始化相关文件

```bash
$ docker run -it \
    -v $PWD/data:/data \
docker pull easysoft/alist:latest
```

或者修改 docker-compose.yml 文件，添加持久化目录配置

```bash
services:
  AList:
  ...
    volumes:
      - /path/to/persistence:/data
  ...
```

## 五、环境变量

<!-- 这里写应用的【环境变量信息】 -->


| 变量名               | 默认值        | 说明           |
| -------------------- | ------------- | -------------- |
| OS_ARCH              | amd64         | 系统处理器     |
| OS_NAME              | debian-11     | 系统名称       |
| HOME_PAGE            | alist.nn.ci   | 应用主页       |
| ALIST_ADMIN_PASSWORD | qucheng123    | 默认管理员密码 |

## 六、运行

### 6.1 单机Docker-compose方式运行

```bash
# 启动服务
make run

# 查看服务状态
make ps

# 查看服务日志
docker-compose logs -f alist

```

<!-- 这里写应用的【make命令的备注信息】位于文档最后端 -->
**说明:**

- 启动成功后，打开浏览器输入 `http://<你的IP>:5244` 访问管理后台
- 默认用户名：`admin`，默认密码：`qucheng123`
- [VERSION](https://github.com/quicklyon/alist-docker/blob/master/VERSION) 文件中详细的定义了Makefile可以操作的版本
- [docker-compose.yml](https://github.com/quicklyon/alist-docker/blob/master/docker-compose.yml)

## 七、版本升级

<!-- 这里是镜像的【版本升级】信息，通过命令维护，详情参考：https://github.com/quicklyon/template-toolkit -->
