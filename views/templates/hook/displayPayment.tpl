{foreach from=$banks item=banking}
<div class="row">
	<div class="col-xs-12 col-md-6">
	<p class="payment_module"><a style="background:url('{$img_ps_dir|escape:'html':'UTF-8'}modulbank/{$banking.id_pembayaran_bank|intval}.jpg') no-repeat scroll #FBFBFB; background-position: 3% 50%; background-size:67px; " href="{$link->getModuleLink('modulbank', 'payment', ['id_pembayaran_bank'=>$banking.id_pembayaran_bank], true)|escape:'html'}" class="ModulBank">{$banking.nama_bank}</a></p>
	</div>
</div>
{/foreach}