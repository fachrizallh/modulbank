{capture name=path}
    {$paysistem->nama_bank}
{/capture}


<h1 class="page-heading">
{l s='Order summary' mod='ModulBank'}
</h1>

{assign var='current_step' value='payment'}
{include file="$tpl_dir./order-steps.tpl"}

{if $nb_products <= 0}
    <p class="alert alert-warning">
        {l s='Keranjang belanja Anda kosong.' mod='ModulBank'}
    </p>
{else}
    <form action="{$link->getModuleLink('modulbank', 'validation', [], true)|escape:'html'}" method="post">
	<div class="box cheque-box">
		<h3 class="page-subheading">
            {$paysistem->nama_bank}
		</h3>
		<p class="cheque-indent">
			<strong class="dark">
                {l s='Anda telah memilih pembayaran dengan' mod='ModulBank'} {$paysistem->nama_bank}{l s='. Berikut ini adalah ringkasan singkat pesanan Anda:' mod='ModulBank'}
			</strong>
		</p>
		<p>
			- {l s='Jumlah total pesanan Anda adalah' mod='ModulBank'}
			<span id="amount" class="price">{displayPrice price=$total_amount}</span>
            {if $use_taxes == 1}
                {l s='(tax incl.)' mod='ModulBank'}
            {/if}
		</p>
	<p>
		-
        {if $currencies|@count > 1}
            {l s='Kami mengizinkan beberapa mata uang yang akan dikirim melalui ' mod='ModulBank'}
			<div class="form-group">
				<label>{l s='Pilih salah satu:' mod='ModulBank'}</label>
				<select id="currency_payment" class="form-control" name="currency_payment">
                    {foreach from=$currencies item=currency}
						<option value="{$currency.id_currency}" {if $currency.id_currency == $cart_currency}selected="selected"{/if}>
                            {$currency.name}
						</option>
                    {/foreach}
				</select>
			</div>
            {else}
            {l s='Kami mengizinkan mata uang berikut untuk dikirim melalui ' mod='ModulBank'}{$paysistem->nama_bank}{l s=':'}&nbsp;<b>{$currencies.0.name}</b>
			<input type="hidden" name="currency_payment" value="{$currencies.0.id_currency}" />
        {/if}
		</p>
		<p>
			- {l s='Akun informasi pembayaran akan ditampilkan pada halaman selanjutnya.' mod='ModulBank'}
			<br />
			- {l s='Mohon konfirmasi pesanan Anda dengan menekan "Konfirmasi Pesanan."' mod='ModulBank'}.
		</p>
	</div><!-- .cheque-box -->

	<p class="cart_navigation clearfix" id="cart_navigation">
		<a
				class="button-exclusive btn btn-default"
				href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'html':'UTF-8'}">
			<i class="icon-chevron-left"></i>{l s='Other payment methods' mod='ModulBank'}
		</a>
		<input type="hidden" name="id_pembayaran_bank" value="{$paysistem->id|intval}" />
		<button
				class="button btn btn-default button-medium"
				type="submit">
			<span>{l s='Konfirmasi Pesanan' mod='ModulBank'}<i class="icon-chevron-right right"></i></span>
		</button>
	</p>
    </form>
{/if}







