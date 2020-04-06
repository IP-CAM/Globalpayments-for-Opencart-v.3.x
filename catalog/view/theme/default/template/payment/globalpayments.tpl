<style type="text/css">

#globalpayments_form {
	position: relative;
}

<?php if ($checkout == 'api') { ?>
#globalpayments_api {
	text-align: <?php echo $form_align; ?>;
}

#globalpayments_api_form {
	<?php if ($form_width) { ?>
	display: inline-block;
	width: <?php echo $form_width; ?>;
	<?php } ?>
	text-align: left;
}

@media (max-width: 476px) {
	#globalpayments_api_form {
		width: 100%;
	}
}
<?php } ?>

#globalpayments_form .lds-spinner {
	display: inline-block;
	position: absolute;
	width: 64px;
	height: 64px;
	left: 50%;
	top: 50%;
	margin-left: -32px;
	margin-top: -32px;
}

#globalpayments_form .lds-spinner div {
	transform-origin: 32px 32px;
	animation: lds-spinner 1.2s linear infinite;
}

#globalpayments_form .lds-spinner div:after {
	content: " ";
	display: block;
	position: absolute;
	top: 3px;
	left: 29px;
	width: 5px;
	height: 14px;
	border-radius: 20%;
	background: #000;
}

#globalpayments_form .lds-spinner div:nth-child(1) {
	transform: rotate(0deg);
	animation-delay: -1.1s;
}

#globalpayments_form .lds-spinner div:nth-child(2) {
	transform: rotate(30deg);
	animation-delay: -1s;
}

#globalpayments_form .lds-spinner div:nth-child(3) {
	transform: rotate(60deg);
	animation-delay: -0.9s;
}

#globalpayments_form .lds-spinner div:nth-child(4) {
	transform: rotate(90deg);
	animation-delay: -0.8s;
}

#globalpayments_form .lds-spinner div:nth-child(5) {
	transform: rotate(120deg);
	animation-delay: -0.7s;
}

#globalpayments_form .lds-spinner div:nth-child(6) {
	transform: rotate(150deg);
	animation-delay: -0.6s;
}

#globalpayments_form .lds-spinner div:nth-child(7) {
	transform: rotate(180deg);
	animation-delay: -0.5s;
}

#globalpayments_form .lds-spinner div:nth-child(8) {
	transform: rotate(210deg);
	animation-delay: -0.4s;
}

#globalpayments_form .lds-spinner div:nth-child(9) {
	transform: rotate(240deg);
	animation-delay: -0.3s;
}

#globalpayments_form .lds-spinner div:nth-child(10) {
	transform: rotate(270deg);
	animation-delay: -0.2s;
}

#globalpayments_form .lds-spinner div:nth-child(11) {
	transform: rotate(300deg);
	animation-delay: -0.1s;
}

#globalpayments_form .lds-spinner div:nth-child(12) {
	transform: rotate(330deg);
	animation-delay: 0s;
}

#globalpayments_form .hidden {
	display: none;
}

@keyframes lds-spinner {
	0% {
		opacity: 1;
	}
	100% {
		opacity: 0;
	}
}

</style>
<div id="globalpayments_form">
	<?php if ($checkout == 'hpp') { ?>
	<div id="globalpayments_hpp">
		<div class="buttons">
			<div class="pull-right">
				<input type="button" value="<?php echo $button_pay; ?>" id="globalpayments_hpp_button" class="btn btn-primary" />
			</div>
		</div>
	</div>
	<?php } ?>
	<?php if ($checkout == 'api') { ?>
	<div id="globalpayments_api">
		<form id="globalpayments_api_form">
			<div class="form-group required">
				<label class="control-label" for="input_card_number"><?php echo $entry_card_number; ?></label>
				<input type="tel" name="card_number" placeholder="#### #### #### ####" id="input_card_number" class="form-control" />
			</div>
			<div class="form-group required">
				<label class="control-label" for="input_card_holder_name"><?php echo $entry_card_holder_name; ?></label>
				<input type="text" name="card_holder_name" placeholder="<?php echo $entry_card_holder_name; ?>" id="input_card_holder_name" class="form-control" />
			</div>
			<div class="row">
				<div class="col-sm-8">
					<div class="form-group required">
						<label class="control-label" for="input_card_expire_date"><?php echo $entry_card_expire_date; ?></label>
						<div class="row">
							<div class="col-sm-7">
								<select name="card_expire_date_month" id="input_card_expire_date_month" class="form-control">
									<?php foreach ($months as $month) { ?>
									<option value="<?php echo $month['value']; ?>"><?php echo $month['text']; ?></option>
									<?php } ?>
								</select>
							</div>
							<div class="col-sm-5">
								<select name="card_expire_date_year" id="input_card_expire_date_year" class="form-control">
									<?php foreach ($year_expire as $year) { ?>
									<option value="<?php echo $year['value']; ?>"><?php echo $year['text']; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group required">
						<label class="control-label" for="input_card_cvn"><?php echo $entry_card_cvn; ?></label>
						<input type="tel" name="card_cvn" name="card_security_code" placeholder="###" id="input_card_cvn" class="form-control" />
					</div>
				</div>
			</div>
			<div class="buttons">
				<div class="pull-right">
					<input type="button" value="<?php echo $button_pay; ?>" id="globalpayments_api_button" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
					<input type="button" value="<?php echo $button_pay; ?>" id="globalpayments_api_secure_button" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default hidden" />
				</div>
			</div>
		</form>
	</div>
	<?php } ?>
	<div class="lds-spinner hidden"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div>
</div>
<script>

function setupGlobalPayments() {
	<?php if ($checkout == 'hpp') { ?>
	hpp = <?php echo $hpp; ?>;
	
	RealexHpp.setHppUrl('<?php echo $service['url']; ?>');
	RealexHpp.lightbox.init('globalpayments_hpp_button', '<?php echo $hpp_url; ?>', hpp); 
	<?php } ?>
	<?php if ($checkout == 'api') { ?>
	$(document).on('click', '#globalpayments_api_button', function(event) {				
		event.preventDefault();
		
		$('#input_card_number').val($('#input_card_number').val().replace(/ /g, ''));
		
		var cardNumberCheck = RealexRemote.validateCardNumber($('#input_card_number').val());
		var cardHolderNameCheck = RealexRemote.validateCardHolderName($('#input_card_holder_name').val());
		var cardExpireDate = $('#input_card_expire_date_month').val().concat($('#input_card_expire_date_year').val().substr(-2));
		var cardExpireDateFormatCheck = RealexRemote.validateExpiryDateFormat(cardExpireDate);
		var cardExpireDatePastCheck = RealexRemote.validateExpiryDateNotInPast(cardExpireDate);
  
		if ($('#input_card_cvn').val().charAt(0) == '3') {
			var cardCVNCheck = RealexRemote.validateAmexCvn($('#input_card_cvn').val());
		} else {
			var cardCVNCheck = RealexRemote.validateCvn($('#input_card_cvn').val());
		}
			
		if (cardNumberCheck == false || cardHolderNameCheck == false || cardExpireDateFormatCheck == false || cardExpireDatePastCheck == false || cardCVNCheck == false) {
			var error = new Array();
			
			if (cardNumberCheck == false) {
				error['card_number'] = '<?php echo $error_card_number; ?>';
			}
			
			if (cardHolderNameCheck == false) {
				error['card_holder_name'] = '<?php echo $error_card_holder_name; ?>';
			}
			
			if (cardExpireDateFormatCheck == false) {
				error['card_expire_date_month'] = '<?php echo $error_card_expire_date_format; ?>';
				error['card_expire_date_year'] = '<?php echo $error_card_expire_date_format; ?>';
			}
			
			if (cardExpireDatePastCheck == false) {
				error['card_expire_date_month'] = '<?php echo $error_card_expire_date_past; ?>';
				error['card_expire_date_year'] = '<?php echo $error_card_expire_date_past; ?>';
			}
			
			if (cardCVNCheck == false) {
				error['card_cvn'] = '<?php echo $error_card_cvn; ?>';
			}
			
			showGlobalPaymentsAlert({error: error});
		} else {
			<?php if ($secure_status) { ?>
			$('#globalpayments_api_secure_button').trigger('click');
			<?php } else { ?>
			showGlobalPaymentsAlert({wait: true});
			
			$.ajax({
				url: '<?php echo $api_url; ?>',
				type: 'post',
				data: $('#globalpayments_api_form :input'),
				dataType: 'json',
				async: false,
				success: function(json) {			
					showGlobalPaymentsAlert(json);
					
					if (json['success']) {
						location = json['success'];
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
			<?php } ?>
		}
	});		
	<?php } ?>
}

<?php if (($checkout == 'api') && $secure_status) { ?>
function setupGlobalPaymentsSecure2() {	
	const {checkVersion, getBrowserData, initiateAuthentication} = GlobalPayments.ThreeDSecure;

	document.getElementById('globalpayments_api_secure_button').addEventListener('click', async (event) => {
		event.preventDefault();
		
		try {
			checkVersionData = await checkVersion('<?php echo $api_secure_2_check_version_url; ?>', {
				card: {
					number: $('#input_card_number').val()
				}
			});
				
			if (checkVersionData.error) {
				setupGlobalPaymentsSecure1();
				
				return;
			}
		}

		catch (error) {
			setupGlobalPaymentsSecure1();
			
			return;
		}
		
		try {
			authenticationData = await initiateAuthentication('<?php echo $api_secure_2_initiate_authentication_url; ?>', {
				serverTransactionId: checkVersionData.serverTransactionId,
				methodUrlComplete: true,
				card: {
					number: $('#input_card_number').val(),
					expiryMonth: $('#input_card_expire_date_month').val(),
					expiryYear: $('#input_card_expire_date_year').val(),
					securityCode: $('#input_card_cvn').val(),
					cardHolderName: $('#input_card_holder_name').val()
				},
				challengeWindow: {
					windowSize: GlobalPayments.ThreeDSecure.ChallengeWindowSize.FullScreen,
					displayMode: 'lightbox',
				}
            });
			
			showGlobalPaymentsAlert({wait: true});
			
			$.ajax({
				url: '<?php echo $api_secure_2_authorization_url; ?>',
				type: 'post',
				data: $('#globalpayments_api_form').serialize() + '&authenticationData=' + JSON.stringify(authenticationData),
				dataType: 'json',
				async: false,
				success: function(json) {			
					showGlobalPaymentsAlert(json);
					
					if (json['success']) {
						location = json['success'];
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}

		catch (error) {
			//showGlobalPaymentsAlert({'error' : {'warning' : error.reasons[0]['message']}});        

			console.log(error);
		}
	});
}

function setupGlobalPaymentsSecure1() {
	showGlobalPaymentsAlert({wait: true});
	
	$.ajax({
		url: '<?php echo $api_secure_1_setup_url; ?>',
		type: 'post',
		data: $('#globalpayments_api_form :input'),
		dataType: 'json',
		async: false,
		success: function(json) {
			showGlobalPaymentsAlert(json);
					
			if (json['acsUrl']) {
				var secure_data = {'MD' : json['md'], 'PaReq' : json['pareq'], 'TermUrl' : json['termUrl']};
				
				RealexRemote.setAcsUrl(json['acsUrl']);
				RealexRemote.lightbox.init('globalpayments_api_form', '<?php echo $api_secure_1_authorization_url; ?>', secure_data);
			}
			
			if (json['success']) {
				location = json['success'];
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
}
<?php } ?>

function showGlobalPaymentsAlert(json) {
	$('#globalpayments_form .alert').remove();
	$('#globalpayments_form .form-group').removeClass('has-error');
	$('#globalpayments_form .lds-spinner').addClass('hidden');
		
	if (json['wait']) {		
		$('#globalpayments_form .lds-spinner').removeClass('hidden');
	}
	
	if (json['error']) {
		if (json['error']['warning']) {
			$('#globalpayments_form').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i><button type="button" class="close" data-dismiss="alert">&times;</button> ' + json['error']['warning'] + '</div>');
		}
		
		for (i in json['error']) {
			var element = $('#globalpayments_form #input_' + i);
			
			element.parents('.form-group').addClass('has-error');
		}
	}
}

function readyGlobalPayments() {
	<?php if ($checkout == 'hpp') { ?>
	if (typeof RealexHpp === 'undefined') {
		setTimeout(readyGlobalPayments, 100);
	} else {
		setupGlobalPayments();
	}
	<?php } ?>
	<?php if ($checkout == 'api') { ?>
	if (typeof RealexRemote === 'undefined') {
		setTimeout(readyGlobalPayments, 100);
	} else {
		setupGlobalPayments();
	}
	<?php } ?>
}

function readyGlobalPaymentsSecure() {
	if (typeof GlobalPayments === 'undefined') {
		setTimeout(readyGlobalPaymentsSecure, 100);
	} else {
		setupGlobalPaymentsSecure2();
	}
}

<?php if ($checkout == 'hpp') { ?>
if (typeof RealexHpp === 'undefined') {
	var script = document.createElement('script');
	script.type = 'text/javascript';
	script.src = 'catalog/view/javascript/globalpayments/rxp-hpp.js';
	script.async = false;
	script.onload = readyGlobalPayments();
	
	var globalpayments_form = document.querySelector('#globalpayments_form');
	globalpayments_form.appendChild(script);
} else {
	setupGlobalPayments();
}
<?php } ?>
<?php if ($checkout == 'api') { ?>
if (typeof RealexRemote === 'undefined') {
	var script = document.createElement('script');
	script.type = 'text/javascript';
	script.src = 'catalog/view/javascript/globalpayments/rxp-remote.js';
	script.async = false;
	script.onload = readyGlobalPayments();
	
	var globalpayments_form = document.querySelector('#globalpayments_form');
	globalpayments_form.appendChild(script);
} else {
	setupGlobalPayments();
}
<?php } ?>
<?php if (($checkout == 'api') && $secure_status) { ?>
if (typeof GlobalPayments === 'undefined') {	
	var script = document.createElement('script');
	script.type = 'text/javascript';
	script.src = 'catalog/view/javascript/globalpayments/globalpayments-3ds.js';
	script.async = false;
	script.onload = readyGlobalPaymentsSecure();
	
	globalpayments_form.appendChild(script);
} else {
	setupGlobalPaymentsSecure2();
}
<?php } ?>

</script>