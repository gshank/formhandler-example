use strict;
use warnings;
use Test::More;
use HTML::FormHandler::Test;

use_ok('MyApp::Form::Controls');

my $form = MyApp::Form::Controls->new;
$form->process;

my $rendered = $form->render_start;
my $expected = '<div class="span8"><form class="form-horizontal" id="control_form" method="post"><fieldset><legend>Controls Bootstrap supports</legend>';
is($rendered, $expected, 'form start rendered correctly');

# text field
$expected =
'<div class="control-group">
  <label class="control-label" for="input01">Text input</label>
  <div class="controls">
    <input type="text" class="input-xlarge" id="input01" name="input01" value="" />
    <p class="help-block">In addition to freeform text, any HTML5 text-based input appears like so.</p>
  </div>
</div>';
$rendered = $form->field('input01')->render;
is_html($rendered, $expected, 'input01 field rendered correctly');

# checkbox
$expected =
'<div class="control-group">
  <label class="control-label" for="optionsCheckbox">Checkbox</label>
  <div class="controls">
    <label class="checkbox" for="optionsCheckbox">
      <input type="checkbox" id="optionsCheckbox" name="optionsCheckbox" value="option1" />
      Option one is this and that&mdash;be sure to include why it’s great
    </label>
  </div>
</div>';
is( $form->field('optionsCheckbox')->widget_wrapper, 'Bootstrap', 'correct wrapper' );
$rendered = $form->field('optionsCheckbox')->render;
is_html($rendered, $expected, 'optionsCheckbox field rendered correctly');

# select
$expected =
'<div class="control-group">
  <label class="control-label" for="select01">Select list</label>
  <div class="controls">
    <select id="select01" name="select01">
      <option value="1" id="select01.0">1</option>
      <option value="2" id="select01.1">2</option>
      <option value="3" id="select01.2">3</option>
      <option value="4" id="select01.3">4</option>
      <option value="5" id="select01.4">5</option>
    </select>
  </div>
</div>';
$rendered = $form->field('select01')->render;
is_html($rendered, $expected, 'select01 renders ok' );

# multiple select
$expected =
'<div class="control-group">
  <label class="control-label" for="multiSelect">Multi-select</label>
  <div class="controls">
    <select multiple="multiple" id="multiSelect" name="multiSelect" size="5">
      <option value="1" id="multiSelect.0">1</option>
      <option value="2" id="multiSelect.1">2</option>
      <option value="3" id="multiSelect.2">3</option>
      <option value="4" id="multiSelect.3">4</option>
      <option value="5" id="multiSelect.4">5</option>
    </select>
  </div>
</div>';
$rendered = $form->field('multiSelect')->render;
is_html($rendered, $expected, 'multiSelect renders ok' );

# file
$expected =
'<div class="control-group">
  <label class="control-label" for="fileInput">File input</label>
  <div class="controls">
    <input class="input-file" id="fileInput" name="fileInput" type="file" />
  </div>
</div>';
$rendered = $form->field('fileInput')->render;
is_html($rendered, $expected, 'fileInput render ok' );

# textarea
$expected =
'<div class="control-group">
  <label class="control-label" for="textarea">Textarea</label>
  <div class="controls">
    <textarea class="input-xlarge" id="textarea" name="textarea" cols="20" rows="4"></textarea>
  </div>
</div>';
$rendered = $form->field('textarea')->render;
is_html($rendered, $expected, 'textarea renders ok' );

# actions
$expected =
'<div class="form-actions">
  <button id="form_actions.save" name="form_actions.save" type="submit" class="btn btn-primary">Save changes</button>
  <button id="form_actions.cancel" name="form_actions.cancel" type="reset" class="btn">Cancel</button>
</div>';
$rendered = $form->field('form_actions')->render;
is_html($rendered, $expected, 'actions renders ok' );

$expected = '
    <div class="span8">
      <form class="form-horizontal" id="control_form" method="post">
        <fieldset>
          <legend>Controls Bootstrap supports</legend>
          <div class="control-group">
            <label class="control-label" for="input01">Text input</label>
            <div class="controls">
              <input type="text" class="input-xlarge" id="input01" name="input01" value="" />
              <p class="help-block">In addition to freeform text, any HTML5 text-based input appears like so.</p>
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="optionsCheckbox">Checkbox</label>
            <div class="controls">
              <label class="checkbox" for="optionsCheckbox">
                <input type="checkbox" id="optionsCheckbox" name="optionsCheckbox" value="option1" />
                Option one is this and that&mdash;be sure to include why it’s great
              </label>
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="select01">Select list</label>
            <div class="controls">
              <select id="select01" name="select01">
                <option value="1" id="select01.0">1</option>
                <option value="2" id="select01.1">2</option>
                <option value="3" id="select01.2">3</option>
                <option value="4" id="select01.3">4</option>
                <option value="5" id="select01.4">5</option>
              </select>
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="multiSelect">Multi-select</label>
            <div class="controls">
              <select multiple="multiple" id="multiSelect" name="multiSelect" size="5">
                <option value="1" id="multiSelect.0">1</option>
                <option value="2" id="multiSelect.1">2</option>
                <option value="3" id="multiSelect.2">3</option>
                <option value="4" id="multiSelect.3">4</option>
                <option value="5" id="multiSelect.4">5</option>
              </select>
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="fileInput">File input</label>
            <div class="controls">
              <input class="input-file" id="fileInput" name="fileInput" type="file" />
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="textarea">Textarea</label>
            <div class="controls">
              <textarea class="input-xlarge" id="textarea" name="textarea" cols="20" rows="4"></textarea>
            </div>
          </div>
          <div class="form-actions">
            <button id="form_actions.save" name="form_actions.save" type="submit" class="btn btn-primary">Save changes</button>
            <button id="form_actions.cancel" name="form_actions.cancel" type="reset" class="btn">Cancel</button>
          </div>
        </fieldset>
      </form>
    </div>';

$rendered = $form->render;
is_html( $rendered, $expected, 'form renders correctly' );

done_testing;
