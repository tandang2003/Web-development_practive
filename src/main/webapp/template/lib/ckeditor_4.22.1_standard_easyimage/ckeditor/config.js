/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
    var path="http://"+document.location.hostname+'/sdh/public/plugin';
    config.filebrowserBrowseUrl = path+'/ckfinder/ckfinder.html';
    config.filebrowserImageBrowseUrl = path+'/ckfinder/ckfinder.html?type=Images';
    config.filebrowserUploadUrl = path+'/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files';
    config.filebrowserImageUploadUrl = path+'/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images';
    config.filebrowserFlashBrowseUrl = path+'/ckfinder/ckfinder.html?type=Flash';
    config.filebrowserFlashUploadUrl = path+'/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Flash';


        };
