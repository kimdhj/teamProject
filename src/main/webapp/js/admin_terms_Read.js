$("#del").click(function(){
	if(confirm("정말 삭제하시겠습니까 ?") == true){
		alert("삭제되었습니다.");
		$("#del_terms").submit();
	}else{
		return;
	}
});

