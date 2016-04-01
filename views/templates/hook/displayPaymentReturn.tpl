<div class="box">
	<p class="cheque-indent">
		<strong class="dark">{l s='Pesanan Anda di %s telah selesai.' sprintf=$shop_name mod='ModulBank'}</strong>
	</p><br>
	<p>
        {l s='Transfer pembayaran Anda dengan' mod='ModulBank'}<br>
        - {l s='Jumlah' mod='ModulBank'} <span class="price"> <strong>{$total_to_pay}</strong></span><br>
        - {l s='Nama Bank' mod='ModulBank'}  <strong>{$nama_bank}</strong><br>
        - {l s='Nama Pemilik Rekening' mod='ModulBank'}  <strong>{$nama_owner}</strong><br>
        - {l s='Nomor Rekening:' mod='ModulBank'}  <strong>{$no_rekening}</strong>
    </p><br>

    <p>
    {if !isset($reference)}
	    {l s='Jangan Lupa untuk menambahkan nomor pesanan Anda #%d pada subjek transfer Anda' sprintf=$id_order mod='ModulBank'}
    {else}
	    {l s='Jangan Lupa untuk menambahkan referensi pesanan Anda %s pada subjek transfer Anda.' sprintf=$reference mod='ModulBank'}
    {/if}
	</p>

	<p><strong>{l s='Pesanan Anda akan dikirimkan segera setelah kami menerima pembayaran Anda.' mod='ModulBank'}</strong></p><br>
	<p>{l s='Jika Anda memiliki pertanyaan, komentar, silahkan hubungi kami' mod='ModulBank'} <a href="{$link->getPageLink('contact', true)|escape:'html':'UTF-8'}">{l s='expert customer support team.' mod='ModulBank'}</a>.</p>
</div>