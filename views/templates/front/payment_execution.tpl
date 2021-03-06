{capture name=path}{$paysistem->name}{/capture}

<h1 class="page-heading">
	{l s='Order summary' mod='universalpay'}
</h1>

{assign var='current_step' value='payment'}
{include file="$tpl_dir./order-steps.tpl"}

{if $nbProducts <= 0}
	<p class="alert alert-warning">
		{l s='Your shopping cart is empty.'}
	</p>
{else}
	<form action="{$link->getModuleLink('universalpay', 'validation', [], true)|escape:'html':'UTF-8'}" method="post">
		<div class="box cheque-box">
			<h3 class="page-subheading">
				{$paysistem->name}
			</h3>
			<p class="cheque-indent">
				{$paysistem->description}
			</p>
			<p>
				<b>{l s='Please confirm your order by clicking "I confirm my order"' mod='universalpay'}.</b>
			</p>
		</div>
		<p class="cart_navigation clearfix" id="cart_navigation">
			<a class="button-exclusive btn btn-default" href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'html':'UTF-8'}">
				<i class="icon-chevron-left"></i>{l s='Other payment methods' mod='universalpay'}
			</a>
			<input type="hidden" name="id_universalpay_system" value="{$paysistem->id}" />
			<button class="button btn btn-default button-medium" type="submit">
				<span>{l s='I confirm my order' mod='universalpay'}<i class="icon-chevron-right right"></i></span>
			</button>
		</p>
	</form>
{/if}