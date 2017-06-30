<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="checkM" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">이용 약관</h4>
			</div>
			<div class="modal-body">
				<textarea rows="5" cols="75" contenteditable="false"
					readonly="readonly">
          			이야 정보 동의 해라
          </textarea>
				<div class="checkbox">
					<label><input type="checkbox" value="">동의 합니다.</label>
				</div>
			<textarea rows="5" cols="75" contenteditable="false"
					readonly="readonly">
          			이야 정보 동의 해라
          </textarea>
				<div class="checkbox">
					<label><input type="checkbox" value="">동의 합니다.</label>
				</div>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-default" onclick="check()" data-dismiss="modal">Commit</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>