# defult

## =========로드 순서=========

- /defult/src/main/webapp/WEB-INF/web.xml	
  - /WEB-INF/context/context-*.xml
    - /defult/src/main/webapp/WEB-INF/context/context-defult-orcl.xml
      - /WEB-INF/sql/**/sql-*.xml
        - /defult/src/main/webapp/WEB-INF/sql/board/sql-defult.xml
      - /defult/src/main/webapp/WEB-INF/mybatis/mybatis-config.xml
        - typeAliases:package name="board" 등록
  - /defult/src/main/webapp/WEB-INF/board/servlet/servlet-board.xml
    - /WEB-INF/board/jsp/
    - component-scan base-package="board"
	
######  === 151102 ===

오늘의 테스트 커밋

##  === 문법 테스트 ===

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
