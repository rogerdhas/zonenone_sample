$(document)
		.ready(
				function() {
					$("#grid")
							.shieldGrid(
									{
										dataSource : {
											data : gridData,
											schema : {
												fields : {
													id : {
														path : "id",
														type : Number
													},
													voice : {
														path : "voice",
														type : Number
													},
													name : {
														path : "name",
														type : String
													},
													text : {
														path : "text",
														type : Number
													},
													data : {
														path : "data",
														type : String
													},
													amt : {
														path : "amt",
														type : Number
													}
												}
											}
										},
										sorting : {
											multiple : true
										},
										rowHover : false,
										columns : [
												{
													field : "name",
													title : "Plan Name",
													width : "120px"
												},
												{
													field : "voice",
													title : "Voice",
													width : "80px"
												},
												{
													field : "text",
													title : "Text",
													width : "80px"
												},
												{
													field : "data",
													title : "Data",
													width : "80px"
												},
												{
													field : "amt",
													title : "Amount",
													width : "80px"
												},
												{
													width : "104px",
													title : "Predicte",
													buttons : [ {
														cls : "deleteButton",
														commandName : "delete",
														caption : "<img src='http://www.prepbootstrap.com/Content/images/template/BootstrapEditableGrid/delete.png' /><span>Predicte</span>"
													} ]
												} ],
										editing : {
											enabled : true,
											event : "click",
											type : "cell",
											confirmation : {
												"delete" : {
													enabled : true,
													template : function(item) {
														return "Predicte plan = "
																+ item.name;
													}
												}
											}
										},
										events : {
											getCustomEditorValue : function(e) {
												e.value = $("#dropdown")
														.swidget().value();
												$("#dropdown").swidget()
														.destroy();
											}
										}
									});

				});




/* Fire Valaidate */
$(document).ready(function(){
   $("#planValidate").validate({
      rules: {
         name: {
            required: true
               }
         },
         messages: {
            name: "Required Field"
         },
         submitHandler: function(form) {
        	 
             form.submit();
         }
     });
});
