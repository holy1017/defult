# defult

스프링 기본프로젝트

커밋은 자주 합시다...

=================

회원가입이나 만들자..

점점귀찬아진다;;

=========로드 순서?=========
/defult/src/main/webapp/WEB-INF/web.xml
	/WEB-INF/context/context-*.xml
		/defult/src/main/webapp/WEB-INF/context/context-defult-orcl.xml
			/defult/src/main/webapp/WEB-INF/mybatis/mybatis-config.xml
				typeAliases:package name="board" 등록
			/WEB-INF/sql/**/sql-*.xml
				/defult/src/main/webapp/WEB-INF/sql/board/sql-defult.xml
	/defult/src/main/webapp/WEB-INF/board/servlet/servlet-board.xml
		/WEB-INF/board/jsp/
		component-scan base-package="board"