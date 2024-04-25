drop table delete_file purge;

create table delete_file(
	board_file varchar2(50),
	reg_date date default sysdate
);

========================================
create or replace trigger save_delete_file -- 트리거 생성
after update or delete -- 발생 이벤트 종류 
on board -- 발생 테이블 
	for each row -- 행 수준의 트리거 발생 - DML 작업에 의해 변경된 각각의 행에 대해서만 발생
	begin -- 조건식
		if(:old.board_file is not null) then
			if(:old.board_file != :new.board_file or :new.board_file is null) then
				insert into delete_file
				(board_file)
				values(:old.board_file);
			end if;
		end if;
	end;
/