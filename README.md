
文件名需要同步的地方：
1. CMakeLists.txt
2. Makefile
3. Dockerfile




特别注意：用 C 语言写库时，为了 C++ 能够调用，应该添加宏

```c
#ifdef __cplusplus
extern "C" {
#endif
void OtherFunc();
#ifdef __cplusplus
}
#endif
```
