$(function() {
  if ($('#ace-edit')[0]) {
    setupAce();
  }
});

var getAceMode = function() {
  return {
    '.js': 'ace/mode/javascript',
    '.rb': 'ace/mode/ruby',
    '.css': 'ace/mode/css',
    '.erb': 'ace/mode/html_ruby'
  }[$('#ace-edit').data('ext')] || 'ace/mode/plain_text';
}

var setupAce = function() {
  var editor = ace.edit('ace-edit');
  var Mode = require(getAceMode()).Mode;
  editor.getSession().setMode(new Mode());
  editor.setTheme("ace/theme/tomorrow_night_blue");
  var textarea = $('textarea.code').hide();
  editor.getSession().setValue(textarea.val());
  editor.getSession().on('change', function(){
    textarea.val(editor.getSession().getValue());
  });

}