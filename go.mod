module github.com/kingjan1999/transfer.sh

go 1.12

require (
	cloud.google.com/go v0.43.0 // indirect
	github.com/PuerkitoBio/ghost v0.0.0-20160324114900-206e6e460e14
	github.com/VojtechVitek/ratelimit v0.0.0-20160722140851-dc172bc0f6d2
	github.com/aws/aws-sdk-go v1.21.1
	github.com/dutchcoders/go-clamd v0.0.0-20170520113014-b970184f4d9e
	github.com/dutchcoders/go-virustotal v0.0.0-20140923143438-24cc8e6fa329
	github.com/dutchcoders/transfer.sh-web v0.0.0-20190716184912-96e06a2276ba
	github.com/elazarl/go-bindata-assetfs v1.0.0
	github.com/fatih/color v1.7.0
	github.com/garyburd/redigo v1.6.0 // indirect
	github.com/goamz/goamz v0.0.0-20180131231218-8b901b531db8
	github.com/golang/gddo v0.0.0-20190419222130-af0f2af80721
	github.com/gorilla/mux v1.7.3
	github.com/gorilla/securecookie v1.1.1 // indirect
	github.com/kingjan1999/xkpasswd-go v0.0.0-20171109195949-8e190f610052
	github.com/kr/pretty v0.1.0 // indirect
	github.com/kr/pty v1.1.8 // indirect
	github.com/mattn/go-colorable v0.1.2 // indirect
	github.com/microcosm-cc/bluemonday v1.0.2
	github.com/minio/cli v1.21.0
	github.com/nu7hatch/gouuid v0.0.0-20131221200532-179d4d0c4d8d // indirect
	github.com/russross/blackfriday v2.0.0+incompatible // indirect
	github.com/shurcooL/sanitized_anchor_name v1.0.0 // indirect
	github.com/skip2/go-qrcode v0.0.0-20190110000554-dc11ecdae0a9
	github.com/stretchr/objx v0.2.0 // indirect
	github.com/tomasen/realip v0.0.0-20180522021738-f0c99a92ddce
	github.com/urfave/cli v1.20.0 // indirect
	github.com/vaughan0/go-ini v0.0.0-20130923145212-a98ad7ee00ec // indirect
	golang.org/x/crypto v0.0.0-20190701094942-4def268fd1a4
	golang.org/x/exp v0.0.0-20190718202018-cfdd5522f6f6 // indirect
	golang.org/x/image v0.0.0-20190703141733-d6a02ce849c9 // indirect
	golang.org/x/mobile v0.0.0-20190719004257-d2bd2a29d028 // indirect
	golang.org/x/net v0.0.0-20190628185345-da137c7871d7
	golang.org/x/oauth2 v0.0.0-20190604053449-0f29369cfe45
	golang.org/x/sys v0.0.0-20190712062909-fae7ac547cb7 // indirect
	golang.org/x/tools v0.0.0-20190719005602-e377ae9d6386 // indirect
	google.golang.org/api v0.7.0
	google.golang.org/grpc v1.22.0 // indirect
	gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127
	gopkg.in/russross/blackfriday.v2 v2.0.1
)

replace gopkg.in/russross/blackfriday.v2 v2.0.1 => github.com/russross/blackfriday/v2 v2.0.1
