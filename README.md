# defult

## === 로드 순서 ===

* /defult/src/main/webapp/WEB-INF/web.xml	
  * === context ===
  * /WEB-INF/context/context-*.xml
    * /WEB-INF/context/context-scott-orcl.xml
    * /WEB-INF/context/context-defult.xml
    * /WEB-INF/context/context-board2.xml
    * /WEB-INF/context/context-defult-orcl.xml
      * /WEB-INF/sql/**/sql-*.xml
        * /WEB-INF/sql/board/sql-defult.xml
      * /WEB-INF/mybatis/mybatis-config.xml
        * typeAliases:package name="board" 등록
  * === servlet ===
  * /WEB-INF/servlet/servlet-defult.xml
  * /WEB-INF/scott/servlet/servlet-scott.xml
  * /WEB-INF/common/servlet/servlet-common.xml
  * /WEB-INF/sample/servlet/servlet-sample.xml
    * component-scan base-package="sample"
    * Mapped URL path [/**]
  * /WEB-INF/board2/servlet/servlet-board2.xml
  * /WEB-INF/board/servlet/servlet-board.xml
    * /WEB-INF/board/jsp/
    * component-scan base-package="board"
    
## === 메모 ===

sql 쪽은 인터페이스로해둘걸.
근데 해뒀어도 의미 없었을거같긴하네;
지금 게시판만 하고 있으니 뭐

## === 151105 ===

파일 업로드 브런치 생성

## === 문법 테스트 ===

# The largest heading (an <h1>ㅅㄷㄴㅅ</h1> tag)
## The second largest heading (an <h2> tag)
…
###### The 6th largest heading (an <h6> tag
In the words of Abraham Lincoln:

> Pardon my french

*This text will be italic*

**This text will be bold**

**Everyone _must_ attend the meeting at 5 o'clock today.**

* Item
* Item
* Item

- Item
- Item
- Item

1. Item 1
2. Item 2
3. Item 3

1. Item 1
  1. A corollary to the above item.
  2. Yet another point to consider.
2. Item 2
  * A corollary that does not need to be ordered.
    * This is indented four spaces, because it's two spaces further than the item above.
    * You might want to consider making a new list.
3. Item 3

Here's an idea: why don't we take `SuperiorProject` and turn it into `**Reasonable**Project`.

Check out this neat program I wrote:

```
x = 0
x = 2 + 2
what is x
```

http://example.com

~~Mistaken text.~~

Here's an example:

```
function test() {
  console.log("notice the blank line before this function?");
}
```

```ruby
require 'redcarpet'
markdown = Redcarpet.new("Hello World!")
puts markdown.to_html
```

First Header  | Second Header
------------- | -------------
Content Cell  | Content Cell
Content Cell  | Content Cell

| First Header  | Second Header |
| ------------- | ------------- |
| Content Cell  | Content Cell  |
| Content Cell  | Content Cell  |

| Name | Description          |
| ------------- | ----------- |
| Help      | ~~Display the~~ help window.|
| Close     | _Closes_ a window     |

| Left-Aligned  | Center Aligned  | Right Aligned |
| :------------ |:---------------:| -----:|
| col 3 is      | some wordy text | $1600 |
| col 2 is      | centered        |   $12 |
| zebra stripes | are neat        |    $1 |

- [x] @mentions, #refs, [links](), **formatting**, and <del>tags</del> are supported
- [x] list syntax is required (any unordered or ordered list supported)
- [x] this is a complete item
- [ ] this is an incomplete item

- [ ] a bigger project
  - [ ] first subtask #1234
  - [ ] follow up subtask #4321
  - [ ] final subtask cc @mention
- [ ] a separate task

* SHA: a5c3785ed8d6a35868bc169f07e40e889087fd2e
* User@SHA: jlord@a5c3785ed8d6a35868bc169f07e40e889087fd2e
* User/Repository@SHA: jlord/sheetsee.js@a5c3785ed8d6a35868bc169f07e40e889087fd2e
* #Num: #26
* GH-Num: GH-26
* User#Num: jlord#26
* User/Repository#Num: jlord/sheetsee.js#26
