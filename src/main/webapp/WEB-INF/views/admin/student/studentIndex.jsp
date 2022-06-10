<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file = "../header.jsp" %>
	<div align="center">
		<h1>학생 목록 페이지</h1> 
		<input type = "button" value ="학생등록" onclick = "location.href='addStudentForm.do'">
		<table id="__st_indexlist" border="1"> 
			<tr>
				<th>학생이름</th><c:forEach var="i" begin="1" end="12"><td align="center" width="150">${i }월</td></c:forEach>	
			</tr>
		</table> 
	</div>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>

const indexList = document.getElementById('__st_indexlist');
const studnetList = JSON.parse('${listStudent}');

function getIndexList(year) {
	$.ajax({
		url : "selectIndex.do",
		type : "POST",
		dataType: 'json',
        contentType: 'application/json;', 
		data :JSON.stringify({
			year : year
		}), 
		success : function(result) {
			console.log("데이터 확인 : ", result); 
			let html ="";  
			for(let s_count = 0; s_count < studnetList.length; s_count++){
				html += `<tr><td>\${studnetList[s_count].s_name }</td>`; 
				
				for(let month = 1; month < 13; month++) {
					html += `<td><ul>`;
					for(let i_count = 0; i_count < result.length; i_count++) {
						let c_month = result[i_count].c_start_day.substring(5,7) 
						if(c_month == month) {
							if(studnetList[s_count].s_code == result[i_count].s_code){
								let content =`<li>\${result[i_count].c_name}</li>`;
								
								console.log(result[i_count].c_paycheck);
								 
								if(result[i_count].c_paycheck == '예정') { 
									content = `<li >\${result[i_count].c_name}(예정)</li>`;
								}
								html += content;			
							}
						}
					}
					html += `</ul></td>`;
				}
				html +=`</tr>`;
			}
			indexList.innerHTML += html;
		}
	});
}


$(document).ready(function() {
	let now = new Date();
	let year = now.getFullYear();
	getIndexList(String(year));	
	
	
	
});
</script>
</body>
</html>
