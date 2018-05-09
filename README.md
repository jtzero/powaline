Inspired by https://github.com/b-ryan/powerline-shell, but written in bash for speed

[![powa](https://ih1.redbubble.net/image.264523058.2514/sticker,375x360-bg,ffffff.u2.png)](https://www.redbubble.com/people/topgearbox/works/9962514-top-gear-jeremy-clarkson-power?carousel_pos=1&p=sticker&ref=work_carousel_work_recommendation&ref_id=10462796)

On my mac, it usually clocks in around 0m0.46\~s (my linux machine clocks in at .3\~ with a smaller processor so your results may vary)

![powline time](https://i.imgur.com/TGHN58h.png)

Also it doesn't have to be configured on two lines like the above, that is just the default to show the most segments/components at once

## Requirements
* &gt;= Bash 4.2
* [asdf-vm](https://github.com/asdf-vm)
* possibly https://github.com/powerline/fonts
 
## Install

`git clone https://github.com/jtzero/powaline.git ~/.powaline`
add `source ~/.powaline/powaline.sh`

to where ever you put
```
. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash
```
## Known Issues
* no Erlang support
* no Java support
* no HG or Svn Support
* only uses asdf-vm
* no .ssh pipe  awareness
