//추가버튼
function plus_banner(){
	var html = '';
	
	html += '<div id="can_del">';
	html += '<div id="banner_thumbnail"><img width="100%" height="20%" id="banner_show1"/></div>';
	html += '<div class="row d-flex">';
	html += '<div class="col"><input type="file" id="banner_image1" id="banner_file" name="banner_file" accept="/image/*" onchange="setBannerThumbnail(event);"/></div>';
	html += '<div class="col" id="banner_name_wrap"><div>배너 이름 : </div><input type="text" id="banner_name" name="banner_name" value=""></div>';
	html += '<div class="col-2"><button type="button" class="btn btn-light" onclick="minus_banner(this);">배너 삭제</button></div>';
	html += '</div>';
	html += '<div><br /></div>';
	html += '</div>';
	
	$("#bannerFor").append(html);
}
//삭제버튼
function minus_banner(obj){
	var div = $(obj).parent().parent().parent();
	
	console.log(div);
	div.remove();
}

//아이콘 섬네일
function setThumbnail(event) {
  var reader = new FileReader();

  reader.onload = function (event) {
    var img = document.createElement("img");
    img.setAttribute("src", event.target.result);
    img.width = 139;
    img.height = 56;
    removeAllchild(document.querySelector("div#icon_thumbnail"));
    document.querySelector("div#icon_thumbnail").appendChild(img);
  };
  function removeAllchild(div) {
    while (div.hasChildNodes()) {
      div.removeChild(div.firstChild);
    }
  }
  reader.readAsDataURL(event.target.files[0]);
}

//배너 섬네일
function setBannerThumbnail(ev) {

  var reader = new FileReader();

  reader.onload = function (event) {
    var img = document.createElement("img");
    img.setAttribute("src", event.target.result);
    img.setAttribute("width", "100%");
    img.setAttribute("height", "10%");
 
    $(ev.target).parents("#can_del").children("div#banner_thumbnail").html(img);
   
  };
  reader.readAsDataURL(event.target.files[0]);
}

