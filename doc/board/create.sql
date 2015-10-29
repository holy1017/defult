
CREATE TABLE defult_board
(
	b_no                 INTEGER NOT NULL ,
	b_title              VARCHAR2(1000) NOT NULL ,
	b_content            VARCHAR2(4000) NOT NULL ,
	b_indate             DATE DEFAULT  sysdate  NOT NULL ,
	b_eddate             DATE DEFAULT  sysdate  NOT NULL ,
	u_no                 INTEGER NOT NULL 
);



CREATE UNIQUE INDEX XPK게시판 ON defult_board
(b_no   ASC,u_no   ASC);



ALTER TABLE defult_board
	ADD CONSTRAINT  XPK게시판 PRIMARY KEY (b_no,u_no);



CREATE TABLE defult_reply
(
	r_no                 INTEGER NOT NULL ,
	content              VARCHAR2(1000) NOT NULL ,
	b_no                 INTEGER NOT NULL ,
	u_no                 INTEGER NOT NULL 
);



CREATE UNIQUE INDEX XPK덧글 ON defult_reply
(r_no   ASC,b_no   ASC,u_no   ASC);



ALTER TABLE defult_reply
	ADD CONSTRAINT  XPK덧글 PRIMARY KEY (r_no,b_no,u_no);



CREATE TABLE defult_user
(
	u_no                 INTEGER NOT NULL ,
	u_id                 VARCHAR2(20) NOT NULL ,
	u_pw                 VARCHAR2(100) NOT NULL ,
	u_nick               VARCHAR2(20) NOT NULL ,
	u_indate             DATE DEFAULT  sysdate  NOT NULL 
);



CREATE UNIQUE INDEX XPK회원 ON defult_user
(u_no   ASC);



ALTER TABLE defult_user
	ADD CONSTRAINT  XPK회원 PRIMARY KEY (u_no);



ALTER TABLE defult_board
	ADD (CONSTRAINT fk_u_b FOREIGN KEY (u_no) REFERENCES defult_user (u_no));



ALTER TABLE defult_reply
	ADD (CONSTRAINT fk_b_r FOREIGN KEY (b_no, u_no) REFERENCES defult_board (b_no, u_no));



ALTER TABLE defult_reply
	ADD (CONSTRAINT fk_u_r FOREIGN KEY (u_no) REFERENCES defult_user (u_no));



CREATE  TRIGGER tI_defult_board BEFORE INSERT ON defult_board for each row
-- ERwin Builtin Trigger
-- INSERT trigger on defult_board 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* defult_user  defult_board on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000f5a3", PARENT_OWNER="", PARENT_TABLE="defult_user"
    CHILD_OWNER="", CHILD_TABLE="defult_board"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="fk_u_b", FK_COLUMNS="u_no" */
    SELECT count(*) INTO NUMROWS
      FROM defult_user
      WHERE
        /* %JoinFKPK(:%New,defult_user," = "," AND") */
        :new.u_no = defult_user.u_no;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert defult_board because defult_user does not exist.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER  tD_defult_board AFTER DELETE ON defult_board for each row
-- ERwin Builtin Trigger
-- DELETE trigger on defult_board 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* defult_board  defult_reply on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000e72e", PARENT_OWNER="", PARENT_TABLE="defult_board"
    CHILD_OWNER="", CHILD_TABLE="defult_reply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="fk_b_r", FK_COLUMNS="b_no""u_no" */
    SELECT count(*) INTO NUMROWS
      FROM defult_reply
      WHERE
        /*  %JoinFKPK(defult_reply,:%Old," = "," AND") */
        defult_reply.b_no = :old.b_no AND
        defult_reply.u_no = :old.u_no;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete defult_board because defult_reply exists.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_defult_board AFTER UPDATE ON defult_board for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on defult_board 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* defult_board  defult_reply on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00021ec2", PARENT_OWNER="", PARENT_TABLE="defult_board"
    CHILD_OWNER="", CHILD_TABLE="defult_reply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="fk_b_r", FK_COLUMNS="b_no""u_no" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.b_no <> :new.b_no OR 
    :old.u_no <> :new.u_no
  THEN
    SELECT count(*) INTO NUMROWS
      FROM defult_reply
      WHERE
        /*  %JoinFKPK(defult_reply,:%Old," = "," AND") */
        defult_reply.b_no = :old.b_no AND
        defult_reply.u_no = :old.u_no;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update defult_board because defult_reply exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Trigger */
  /* defult_user  defult_board on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="defult_user"
    CHILD_OWNER="", CHILD_TABLE="defult_board"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="fk_u_b", FK_COLUMNS="u_no" */
  SELECT count(*) INTO NUMROWS
    FROM defult_user
    WHERE
      /* %JoinFKPK(:%New,defult_user," = "," AND") */
      :new.u_no = defult_user.u_no;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update defult_board because defult_user does not exist.'
    );
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_defult_reply BEFORE INSERT ON defult_reply for each row
-- ERwin Builtin Trigger
-- INSERT trigger on defult_reply 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* defult_board  defult_reply on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00020004", PARENT_OWNER="", PARENT_TABLE="defult_board"
    CHILD_OWNER="", CHILD_TABLE="defult_reply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="fk_b_r", FK_COLUMNS="b_no""u_no" */
    SELECT count(*) INTO NUMROWS
      FROM defult_board
      WHERE
        /* %JoinFKPK(:%New,defult_board," = "," AND") */
        :new.b_no = defult_board.b_no AND
        :new.u_no = defult_board.u_no;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert defult_reply because defult_board does not exist.'
      );
    END IF;

    /* ERwin Builtin Trigger */
    /* defult_user  defult_reply on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="defult_user"
    CHILD_OWNER="", CHILD_TABLE="defult_reply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="fk_u_r", FK_COLUMNS="u_no" */
    SELECT count(*) INTO NUMROWS
      FROM defult_user
      WHERE
        /* %JoinFKPK(:%New,defult_user," = "," AND") */
        :new.u_no = defult_user.u_no;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert defult_reply because defult_user does not exist.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_defult_reply AFTER UPDATE ON defult_reply for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on defult_reply 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* defult_board  defult_reply on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0002160e", PARENT_OWNER="", PARENT_TABLE="defult_board"
    CHILD_OWNER="", CHILD_TABLE="defult_reply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="fk_b_r", FK_COLUMNS="b_no""u_no" */
  SELECT count(*) INTO NUMROWS
    FROM defult_board
    WHERE
      /* %JoinFKPK(:%New,defult_board," = "," AND") */
      :new.b_no = defult_board.b_no AND
      :new.u_no = defult_board.u_no;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update defult_reply because defult_board does not exist.'
    );
  END IF;

  /* ERwin Builtin Trigger */
  /* defult_user  defult_reply on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="defult_user"
    CHILD_OWNER="", CHILD_TABLE="defult_reply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="fk_u_r", FK_COLUMNS="u_no" */
  SELECT count(*) INTO NUMROWS
    FROM defult_user
    WHERE
      /* %JoinFKPK(:%New,defult_user," = "," AND") */
      :new.u_no = defult_user.u_no;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update defult_reply because defult_user does not exist.'
    );
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_defult_user AFTER DELETE ON defult_user for each row
-- ERwin Builtin Trigger
-- DELETE trigger on defult_user 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* defult_user  defult_board on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0001d838", PARENT_OWNER="", PARENT_TABLE="defult_user"
    CHILD_OWNER="", CHILD_TABLE="defult_board"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="fk_u_b", FK_COLUMNS="u_no" */
    SELECT count(*) INTO NUMROWS
      FROM defult_board
      WHERE
        /*  %JoinFKPK(defult_board,:%Old," = "," AND") */
        defult_board.u_no = :old.u_no;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete defult_user because defult_board exists.'
      );
    END IF;

    /* ERwin Builtin Trigger */
    /* defult_user  defult_reply on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="defult_user"
    CHILD_OWNER="", CHILD_TABLE="defult_reply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="fk_u_r", FK_COLUMNS="u_no" */
    SELECT count(*) INTO NUMROWS
      FROM defult_reply
      WHERE
        /*  %JoinFKPK(defult_reply,:%Old," = "," AND") */
        defult_reply.u_no = :old.u_no;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete defult_user because defult_reply exists.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_defult_user AFTER UPDATE ON defult_user for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on defult_user 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* defult_user  defult_board on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00020ec2", PARENT_OWNER="", PARENT_TABLE="defult_user"
    CHILD_OWNER="", CHILD_TABLE="defult_board"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="fk_u_b", FK_COLUMNS="u_no" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.u_no <> :new.u_no
  THEN
    SELECT count(*) INTO NUMROWS
      FROM defult_board
      WHERE
        /*  %JoinFKPK(defult_board,:%Old," = "," AND") */
        defult_board.u_no = :old.u_no;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update defult_user because defult_board exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Trigger */
  /* defult_user  defult_reply on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="defult_user"
    CHILD_OWNER="", CHILD_TABLE="defult_reply"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="fk_u_r", FK_COLUMNS="u_no" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.u_no <> :new.u_no
  THEN
    SELECT count(*) INTO NUMROWS
      FROM defult_reply
      WHERE
        /*  %JoinFKPK(defult_reply,:%Old," = "," AND") */
        defult_reply.u_no = :old.u_no;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update defult_user because defult_reply exists.'
      );
    END IF;
  END IF;


-- ERwin Builtin Trigger
END;
/


-- Sequence
CREATE SEQUENCE DEFULT.DEFULT_USER_SEQ
START WITH 1
  MAXVALUE 999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER;

-- Trigger
CREATE TRIGGER DEFULT.DEFULT_USER_TRG
BEFORE INSERT
ON DEFULT.DEFULT_USER
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column U_NO
  :new.U_NO := DEFULT_USER_SEQ.nextval;
END DEFULT_USER_TRG;
/
-- Sequence
CREATE SEQUENCE DEFULT.DEFULT_REPLY_SEQ
START WITH 1
  MAXVALUE 999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER;

-- Trigger
CREATE TRIGGER DEFULT.DEFULT_REPLY_TRG
BEFORE INSERT
ON DEFULT.DEFULT_REPLY
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column R_NO
  :new.R_NO := DEFULT_REPLY_SEQ.nextval;
END DEFULT_REPLY_TRG;
/
-- Sequence
CREATE SEQUENCE DEFULT.DEFULT_BOARD_SEQ
START WITH 1
  MAXVALUE 999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER;

-- Trigger
CREATE TRIGGER DEFULT.DEFULT_BOARD_TRG
BEFORE INSERT
ON DEFULT.DEFULT_BOARD
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column B_NO
  :new.B_NO := DEFULT_BOARD_SEQ.nextval;
END DEFULT_BOARD_TRG;
/
