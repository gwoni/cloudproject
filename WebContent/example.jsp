<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>CloudService</title>
   	<script src="http://code.jquery.com/jquery-latest.js"></script>
    <link href="/css/bootstrap.css" rel="stylesheet" >
    <link href="/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="/css/bootstrap-responsive.min.css" rel="stylesheet">
    <style> body {padding-top: 60px;padding-bottom: 40px; } </style>
    <!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
  </head>



<pre>This is a contrived example, but it represents the behavior I was seeing when there are competing z-indexed dom elements and .modal is not a sibling of .modal-backdrop.</pre >
<div class="well z z-1">
    <p>This content has a z-index of -1</p>
</div>
<div class="well z z3"> 
    <p>This content, including the modal button, is in a div with z-index of 3.</p>



<!-- sample modal content -->
          <div id="myModal" class="modal hide fade">
            <div class="modal-header">
              <button class="close" data-dismiss="modal">&times;</button>
              <h3>Modal Heading</h3>
            </div>
            <div class="modal-body">
              <h4>Text in a modal</h4>
              <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem.</p>

              <h4>Popover in a modal</h4>
              <p>This <a href="#" class="btn popover-test" title="A Title" data-content="And here's some amazing content. It's very engaging. right?">button</a> should trigger a popover on hover.</p>

              <h4>Tooltips in a modal</h4>
              <p><a href="#" class="tooltip-test" title="Tooltip">This link</a> and <a href="#" class="tooltip-test" title="Tooltip">that link</a> should have tooltips on hover.</p>

  

            </div>
            <div class="modal-footer">
              <a href="#" class="btn" data-dismiss="modal" >Close</a>
              <a href="#" class="btn btn-primary">Save changes</a>
            </div>
          </div>
          <a data-toggle="modal" href="#myModal" class="btn btn-primary btn-large modal-btn">Launch BUSTED modal</a>
    
</div>

<div class="well z z3"> 
    <p>This content, including the modal button, is in a div with z-index of 3.</p>


<div class="fixedVersion">
<!-- sample modal content -->
          <div id="myModal2" class="modal hide fade">
            <div class="modal-header">
              <button class="close" data-dismiss="modal">&times;</button>
              <h3>Modal Heading</h3>
            </div>
            <div class="modal-body">
              <h4>Text in a modal</h4>
              <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem.</p>

              <h4>Popover in a modal</h4>
              <p>This <a href="#" class="btn popover-test" title="A Title" data-content="And here's some amazing content. It's very engaging. right?">button</a> should trigger a popover on hover.</p>

              <h4>Tooltips in a modal</h4>
              <p><a href="#" class="tooltip-test" title="Tooltip">This link</a> and <a href="#" class="tooltip-test" title="Tooltip">that link</a> should have tooltips on hover.</p>

  

            </div>
            <div class="modal-footer">
              <a href="#" class="btn" data-dismiss="modal" >Close</a>
              <a href="#" class="btn btn-primary">Save changes</a>
            </div>
          </div>
          <a data-toggle="modal" href="#myModal2" class="btn btn-primary btn-large modal-btn">Launch FIXED modal</a>
    </div>
</div>

<pre>The weird z-indexing problems happen because .modal and .modal-backdrop are not siblings.  So I recommend the global one-liner:<br/>$('.modal').appendTo($('body'));</pre>
</html>