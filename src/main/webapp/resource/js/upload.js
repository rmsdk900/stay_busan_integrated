/**
 * file Upload / display
 */
/* image type 이면 true 아니면 false */
function checkImageType(fileName){
	var pattern = /jpg|gif|png|jpeg/i;
	return fileName.match(pattern);
}
		
function getFileInfo(fullName){
	var imgSrc, fileName, getLink;
	
	// 일반파일
	imgSrc = contextPath+"/resources/image/file.png";
	getLink = contextPath+"/displayFile?fileName="+fullName;
	
	fileName = fullName.substr(fullName.lastIndexOf("_")+1);
	return {fileName : fileName, imgSrc : imgSrc, fullName : fullName, getLink : getLink};
}