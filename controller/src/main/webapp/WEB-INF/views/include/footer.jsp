<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
</div>
<!-- ./wrapper -->
<div class="modal fade" id="myModal" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title">Help Desk</h4>
			</div>
			<div class="modal-body">
				<p>
					시스템 담당자 : 서비스수행본부 사업시너지담당 QA팀 박혜민K, 홍성효S <br> <a
						href="/ticket/readPage?page=1&perPageNum=15&searchType&keyword&bno=10000"
						style="color: #333333; text-align: left; font-size: 14px"> <i
						class="fa fa-yelp" aria-hidden="true"></i> 문의 작성 방법 바로가기
					</a>

				</p>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default pull-right"
					data-dismiss="modal">Close</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<footer class="main-footer">
	<div class="pull-right hidden-xs">
		<b>Version</b> 1.0.0
	</div>
	<strong>Copyright © 2019 KTDS QA Team</strong>
</footer>


<!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
<div class='control-sidebar-bg'></div>



<!-- Bootstrap 3.3.2 JS -->
<script src="/resources/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>
<!-- FastClick -->
<script src='/resources/plugins/fastclick/fastclick.min.js'></script>
<!-- AdminLTE App -->
<script src="/resources/dist/js/app.js" type="text/javascript"></script>
<!-- AdminLTE for demo purposes -->
<script type="text/javascript">
    (function ($) {
        /* Store sidebar state */
        $('.sidebar-toggle').click(function(event) {
            event.preventDefault();
            if (Boolean(localStorage.getItem('sidebar-toggle-collapse'))) {
                localStorage.setItem('sidebar-toggle-collapse', '');
             } else {
                localStorage.setItem('sidebar-toggle-collapse', '1');
             }
         });
    })(jQuery);
	</script>
<script src="/resources/dist/js/demo.js" type="text/javascript"></script>
</body>
</html>