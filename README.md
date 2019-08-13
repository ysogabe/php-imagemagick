# php-imagick

php Docker image

- Composer
- imagick
- nginx

## Usages

```bash
$ docker run -it --rm -v `pwd`:(Composer Project dir) -p 80:80 ysogabe/php-imagick
```

## thanks

This Docker file referred to the following site.

- [nginx settings](https://blog.amedama.jp/entry/2018/01/30/230221)
- [Laravel settings](https://qiita.com/nooboolean/items/7deeb9bd9823a8b92e09)
- [Prestissimo](https://qiita.com/zeriyoshi/items/0244051dcfd4c309004f)
