function tableCreate(){
			var html = '';
						
			var name = $("#inName").val();
			var job = $("#inJob").val();
			var birth = $("#inBirth").val();
			var remove = $("remove").val();
						
			html += '<tr>';
			html += '<td>'+name+'</td>';
			html += '<td>'+job+'</td>';
			html += '<td>'+birth+'</td>';
			html += '<td><button onclick="tableDelete(this)" id="remove">remove</button></td>';
			html += '</tr>';
						
			$("#dynamicTable").append(html);
						
			$("#inName").val('');
			$("#inJob").val('');
			$("#inBirth").val('');
		}

		function tableDelete(obj){
			var tr = $(obj).parent().parent();

			tr.remove();
		}