//추가버튼
function plus_banner(){
	var html = '';
	
	html += '<div id="can_del">';
	html += '<div id="banner_thumbnail"><img width="100%" height="20%" id="banner_show1"/></div>';
	html += '<div class="row d-flex">';
	html += '<div class="col" id="banner_file"><input type="file" id="banner_image1" name="banner_file" accept="/image/*" onchange="setBannerThumbnail(event);"/></div>';
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
function setBannerThumbnail(event) {
  var reader = new FileReader();

  reader.onload = function (event) {
    var img = document.createElement("img");
    img.setAttribute("src", event.target.result);
    img.setAttribute("width", "100%");
    img.setAttribute("height", "10%");
    removeAllchild(document.querySelector("div#banner_thumbnail"));
    document.querySelector("div#banner_thumbnail").appendChild(img);
  };
  function removeAllchild(div) {
    while (div.hasChildNodes()) {
      div.removeChild(div.firstChild);
    }
  }
  reader.readAsDataURL(event.target.files[0]);
}
function setBannerThumbnail1(event) {
  var reader = new FileReader();

  reader.onload = function (event) {
    var img = document.createElement("img");
    img.setAttribute("src", event.target.result);
    img.setAttribute("width", "100%");
    img.setAttribute("height", "10%");
    removeAllchild(document.querySelector("div#banner_thumbnail1"));
    document.querySelector("div#banner_thumbnail1").appendChild(img);
  };
  function removeAllchild(div) {
    while (div.hasChildNodes()) {
      div.removeChild(div.firstChild);
    }
  }
  reader.readAsDataURL(event.target.files[0]);
}
function setBannerThumbnail2(event) {
  var reader = new FileReader();

  reader.onload = function (event) {
    var img = document.createElement("img");
    img.setAttribute("src", event.target.result);
    img.setAttribute("width", "100%");
    img.setAttribute("height", "10%");
    removeAllchild(document.querySelector("div#banner_thumbnail2"));
    document.querySelector("div#banner_thumbnail2").appendChild(img);
  };
  function removeAllchild(div) {
    while (div.hasChildNodes()) {
      div.removeChild(div.firstChild);
    }
  }
  reader.readAsDataURL(event.target.files[0]);
}
function setBannerThumbnail3(event) {
  var reader = new FileReader();

  reader.onload = function (event) {
    var img = document.createElement("img");
    img.setAttribute("src", event.target.result);
    img.setAttribute("width", "100%");
    img.setAttribute("height", "10%");
    removeAllchild(document.querySelector("div#banner_thumbnail3"));
    document.querySelector("div#banner_thumbnail3").appendChild(img);
  };
  function removeAllchild(div) {
    while (div.hasChildNodes()) {
      div.removeChild(div.firstChild);
    }
  }
  reader.readAsDataURL(event.target.files[0]);
}
function setBannerThumbnail4(event) {
  var reader = new FileReader();

  reader.onload = function (event) {
    var img = document.createElement("img");
    img.setAttribute("src", event.target.result);
    img.setAttribute("width", "100%");
    img.setAttribute("height", "10%");
    removeAllchild(document.querySelector("div#banner_thumbnail4"));
    document.querySelector("div#banner_thumbnail4").appendChild(img);
  };
  function removeAllchild(div) {
    while (div.hasChildNodes()) {
      div.removeChild(div.firstChild);
    }
  }
  reader.readAsDataURL(event.target.files[0]);
}
