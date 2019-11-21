<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-ms_integration" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <ul class="nav nav-tabs">
          <li class="active"><a href="#tab-setting" data-toggle="tab"><?php echo $tab_setting; ?></a></li>
          <?php if($ms){ ?><li><a href="#tab-products" data-toggle="tab"><?php echo $tab_products; ?></a></li><?php } ?>
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="tab-setting">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-ms_integration" class="form-horizontal">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="ms_integration_status" id="input-status" class="form-control">
                    <?php if ($settings["ms_integration_status"]) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-ms-login"><?php echo $entry_login; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="ms_integration_ms_login" id="input-ms-login" class="form-control" value="<?php echo $settings['ms_integration_ms_login'] ?>">
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-ms-password"><?php echo $entry_password; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="ms_integration_ms_password" id="input-ms-password" class="form-control" value="<?php echo $settings['ms_integration_ms_password'] ?>">
                </div>
              </div>

              <?php if($ms){ ?>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-ms-organization"><span data-toggle="tooltip" title="<?php echo $help_organization; ?>"><?php echo $entry_organization; ?></span></label>
                  <div class="col-sm-10">
                    <select name="ms_integration_ms_organization" id="input-ms-organization" class="form-control">
                      <?php foreach($setting_organization_select as $key=>$name) { ?>
                      <?php if($key==$settings["ms_integration_ms_organization"]) { ?>
                      <option value="<?php echo $key ?>" selected="selected"><?php echo $name; ?></option>
                      <?php } else {?>
                      <option value="<?php echo $key ?>"><?php echo $name; ?></option>
                      <?php }?>
                      <?php } ?>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-ms-agent"><span data-toggle="tooltip" title="<?php echo $help_agent; ?>"><?php echo $entry_agent; ?></span></label>
                  <div class="col-sm-10">
                    <select name="ms_integration_ms_agent" id="input-ms-agent" class="form-control">
                      <?php foreach($setting_agent_select as $key=>$name) { ?>
                      <?php if($key==$settings["ms_integration_ms_agent"]) { ?>
                      <option value="<?php echo $key ?>" selected="selected"><?php echo $name; ?></option>
                      <?php } else {?>
                      <option value="<?php echo $key ?>"><?php echo $name; ?></option>
                      <?php }?>
                      <?php } ?>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-sm-12">
                    <?php echo $help_cron?><br>
                    <?php echo $cron_link?>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-cron-time"><span data-toggle="tooltip" title="<?php echo $help_cron_time; ?>"><?php echo $entry_cron_time; ?></span></label>
                  <div class="col-sm-10">
                    <input type="text" name="ms_integration_cron_time" id="input-cron-time" class="form-control" value="<?php echo $settings['ms_integration_cron_time'] ?>">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-stock"><?php echo $entry_stock; ?></label>
                  <div class="col-sm-10">
                    <select name="ms_integration_stock" id="input-stock" class="form-control">
                      <?php if ($settings["ms_integration_stock"]) { ?>
                      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                      <option value="0"><?php echo $text_disabled; ?></option>
                      <?php } else { ?>
                      <option value="1"><?php echo $text_enabled; ?></option>
                      <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                      <?php } ?>
                    </select>
                  </div>
                </div>
              <?php } ?>
            </form>
          </div>
          <?php if($ms){ ?>
          <div class="tab-pane" id="tab-products">
            <form action="<?php echo $delete_links; ?>" method="post" enctype="multipart/form-data" id="form-ms_delete_links" class="form-horizontal">
            </form>
            <form action="<?php echo $link_products; ?>" method="post" enctype="multipart/form-data" id="form-ms_integration_link_product" class="form-horizontal">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-ms-id"><span data-toggle="tooltip" title="<?php echo $help_ms_id; ?>"><?php echo $entry_ms_id; ?></span></label>
                <div class="col-sm-10">
                  <select name="ms_integration_ms_id" id="input-ms-id" class="form-control">
                    <?php foreach($setting_ms_select as $key=>$name) { ?>
                    <?php if($key==$settings["ms_integration_ms_id"]) { ?>
                    <option value="<?php echo $key ?>" selected="selected"><?php echo $name; ?></option>
                    <?php } else {?>
                    <option value="<?php echo $key ?>"><?php echo $name; ?></option>
                    <?php }?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-oc-id"><span data-toggle="tooltip" title="<?php echo $help_oc_id; ?>"><?php echo $entry_oc_id; ?></span></label>
                <div class="col-sm-10">
                  <select name="ms_integration_oc_id" id="input-oc-id" class="form-control">
                    <?php foreach($setting_oc_select as $key=>$name) { ?>
                    <?php if($key==$settings["ms_integration_oc_id"]) { ?>
                    <option value="<?php echo $key ?>" selected="selected"><?php echo $name; ?></option>
                    <?php } else {?>
                    <option value="<?php echo $key ?>"><?php echo $name; ?></option>
                    <?php }?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-create-product"><span data-toggle="tooltip" title="<?php echo $help_create_product; ?>"><?php echo $entry_create_product; ?></span></label>
                <div class="col-sm-10">
                  <select name="ms_integration_create_product" id="input-create-product" class="form-control">
                    <?php if ($settings["ms_integration_create_product"]) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-2">
                </div>
                <div class="col-sm-2">
                  <button class="btn btn-primary" type="submit"><?php echo $import_text; ?></button>
                </div>
                <div class="col-sm-2">
                  <button class="btn btn-danger" type="submit" form="form-ms_delete_links"><?php echo $delete_text; ?></button>
                </div>
              </div>
            </form>
          </div>
          <?php } ?>
        </div>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>