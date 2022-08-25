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
