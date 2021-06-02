SELECT a.userId,a.userName,a.userHp,
`prodName`,`price`,`amount`
FROM `tbl_user` AS a JOIN `tbl_buy` AS b
ON a.userId = b.userId WHERE a.userId = 'lee' ;
USER1