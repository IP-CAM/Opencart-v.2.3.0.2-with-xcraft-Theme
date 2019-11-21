<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">

	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-starter" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
			</div>
			<h1><?php echo $heading_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>

	<div class="container-fluid">
		<?php if ($error_warning) { ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-cogs"></i> <?php echo $heading_title; ?></h3>
			</div>
			<div class="panel-body">
				<p><?php echo $placeholder; ?></p>
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-starter" class="form-horizontal">
					
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
						<div class="col-sm-10">
							<input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
							<?php if ($error_name) { ?>
							<div class="text-danger"><?php echo $error_name; ?></div>
							<?php } ?>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
						<div class="col-sm-10">
							<select name="status" id="input-status" class="form-control">
								<?php if ($status) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>

					<!-- <div class="form-group">
						<label class="col-sm-2 control-label" for="input-field"><?php echo $custom_field; ?></label>
						<div class="col-sm-10">
							<input type="text" name="field" value="<?php echo $field; ?>" placeholder="<?php echo $custom_field; ?>" id="input-field" class="form-control" />
							<?php if ($error_field) { ?>
							<div class="text-danger"><?php echo $error_field; ?></div>
							<?php } ?>
						</div>
					</div> -->

					<div class="form-group">
						<div class="col-sm-10 col-sm-offset-2">

							<ul class="nav nav-tabs">
								<li class="active">
									<a aria-expanded="true" href="#tab-vantage-1" data-toggle="tab">
										<?php echo $custom_warranty; ?>
									</a>
								</li>

								<li >
									<a aria-expanded="false" href="#tab-vantage-2" data-toggle="tab">
										<?php echo $custom_service; ?>
									</a>
								</li>

								<li>
									<a aria-expanded="false" href="#tab-vantage-3" data-toggle="tab">
										<?php echo $custom_prices; ?>
									</a>
								</li>

								<li>
									<a aria-expanded="false" href="#tab-vantage-4" data-toggle="tab">
										<?php echo $custom_delivery; ?>
									</a>
								</li>
							</ul>

							<div class="tab-content">
								<div class="tab-pane active" id="tab-vantage-1">

									<div class="form-group">
										<label for="input-text-warranty" class="col-sm-2 control-label"><?php echo $custom_text; ?></label>
									
										<div class="col-sm-10">

											<input type="text" name="text_warranty" id="input-text-warranty" value="<?php echo $text_warranty; ?>" placeholder="<?php echo $custom_text; ?>" class="form-control">



											<?php if ($error_text_warranty) {?>
												<div class="text-danger">
													<?php echo $error_text_warranty; ?>
														
												</div>
											<?php }?>

										</div>
									</div>

									<div class="form-group">
										<label for="input-icon-warranty" class="col-sm-2 control-label"><?php echo $custom_icon; ?></label>
									
										<div class="col-sm-10">
										
											<input type="text" name="icon_warranty" id="input-icon-warranty" value="<?php echo $icon_warranty; ?>" placeholder="<?php echo $custom_icon; ?>" class="form-control">

											<?php if ($error_icon_warranty) {?>
												<div class="text-danger">
													<?php echo $error_icon_warranty; ?>
														
												</div>
											<?php }?>

										</div>
									</div>

								</div>
							

							
								<div class="tab-pane " id="tab-vantage-2">
									
									<div class="form-group">
										<label for="input-text-service" class="col-sm-2 control-label"><?php echo $custom_text; ?></label>
									
										<div class="col-sm-10">

											<input type="text" name="text_service" id="input-text-service" value="<?php echo $text_service; ?>" placeholder="<?php echo $custom_text; ?>" class="form-control">

											<?php if ($error_text_service) {?>
												<div class="text-danger">
													<?php echo $error_text_service; ?>
														
												</div>
											<?php }?>

										</div>
									</div>

									<div class="form-group">
										<label for="input-icon-service" class="col-sm-2 control-label"><?php echo $custom_icon; ?></label>
									
										<div class="col-sm-10">
										
											<input type="text" name="icon_service" id="input-icon-service" value="<?php echo $icon_service; ?>" placeholder="<?php echo $custom_icon; ?>" class="form-control">

											<?php if ($error_icon_service) {?>
												<div class="text-danger">
													<?php echo $error_icon_service; ?>
														
												</div>
											<?php }?>

										</div>
									</div>

								</div>
							

							
								<div class="tab-pane " id="tab-vantage-3">

									<div class="form-group">
										<label for="input-text-prices" class="col-sm-2 control-label"><?php echo $custom_text; ?></label>
									
										<div class="col-sm-10">

											<input type="text" name="text_prices" id="input-text-prices" value="<?php echo $text_prices; ?>" placeholder="<?php echo $custom_text; ?>" class="form-control">

											<?php if ($error_text_prices) {?>
												<div class="text-danger">
													<?php echo $error_text_prices ?>
														
												</div>
											<?php }?>

										</div>
									</div>

									<div class="form-group">
										<label for="input-icon-prices" class="col-sm-2 control-label"><?php echo $custom_icon; ?></label>
									
										<div class="col-sm-10">
										
											<input type="text" name="icon_prices" id="input-icon-prices" value="<?php echo $icon_prices; ?>" placeholder="<?php echo $custom_icon; ?>" class="form-control">

											<?php if ($error_icon_prices) {?>
												<div class="text-danger">
													<?php echo $error_icon_prices ?>
														
												</div>
											<?php }?>

										</div>
									</div>

								</div>
							

							
								<div class="tab-pane " id="tab-vantage-4">
									
									<div class="form-group">
										<label for="input-text-delivery" class="col-sm-2 control-label"><?php echo $custom_text; ?></label>
									
										<div class="col-sm-10">

											<input type="text" name="text_delivery" id="input-text-delivery" value="<?php echo $text_delivery; ?>" placeholder="<?php echo $custom_text; ?>" class="form-control">

											<?php if ($error_text_delivery) {?>
												<div class="text-danger">
													<?php echo $error_text_delivery ?>
														
												</div>
											<?php }?>

										</div>
									</div>

									<div class="form-group">
										<label for="input-icon-delivery" class="col-sm-2 control-label"><?php echo $custom_icon; ?></label>
									
										<div class="col-sm-10">
										
											<input type="text" name="icon_delivery" id="input-icon-delivery" value="<?php echo $icon_delivery; ?>" placeholder="<?php echo $custom_icon; ?>" class="form-control">

											<?php if ($error_icon_delivery) {?>
												<div class="text-danger">
													<?php echo $error_icon_delivery ?>
														
												</div>
											<?php }?>

										</div>
									</div>

								</div>
							</div>

						</div>
					</div>

				</form>
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>
