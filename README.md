Inspired by https://github.com/b-ryan/powerline-shell, but written in bash for speed

[![powa](https://ih1.redbubble.net/image.264523058.2514/sticker,375x360-bg,ffffff.u2.png)](https://www.redbubble.com/people/chrissyonahype/works/10784374-top-gear-jeremy-clarkson-power)

On my mac, it usually clocks in around 0m0.46\~s (my linux machine clocks in at .3\~ with a smaller processor so your results may vary)

![powline time](https://i.imgur.com/TGHN58h.png)

Also it doesn't have to be configured on two lines like the above, that is just the default to show the most segments/components at once

## Requirements
* &gt;= Bash 4.2
* [asdf-vm](https://github.com/asdf-vm)
* install https://nerdfonts.com/
 
## Install

`git clone https://github.com/jtzero/powaline.git ~/.powaline`

add `source ~/.powaline/powaline.sh`

to where ever you put
```
. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash
```

## Note
* works with source code pro

## TODO
* better font testing

## Known Issues
* no Erlang support
* no Java support
* no HG or Svn Support
* only uses asdf-vm
* no .ssh pipe  awareness
