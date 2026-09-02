{**
 * @file plugins/themes/ammoniteTheme/templates/frontend/pages/editorialHistory.tpl
 *
 * Copyright (c) 2026 Simon Fraser University
 * Copyright (c) 2026 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display context's editorial history page.
 *}
{include file="frontend/components/header.tpl" pageTitle="common.editorialHistory"}

<div class="max-w-xl-1200 mx-xl-auto main-content-layout">
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="common.editorialHistory"}

	<div class="row mt-4">
		<div class="col-12 max-w-sm-900">
			<h1 class="ammonite-h1-text">
				{translate key="common.editorialHistory.page"}
			</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-12 max-w-sm-900 ammonite-regular-text">
			<p>{translate key="common.editorialHistory.page.description"}</p>

			{foreach from=$mastheadRoles item="mastheadRole"}
				{if array_key_exists($mastheadRole->id, $mastheadUsers)}
					<h2 class="ammonite-h2-text mt-4">{$mastheadRole->getLocalizedData('name')|escape}</h2>
					<ul class="list-unstyled">
						{foreach from=$mastheadUsers[$mastheadRole->id] item="mastheadUser"}
							<li class="mb-2">
								{strip}
									<span class="ammonite-breadcrumb-text">
										{foreach name="services" from=$mastheadUser['services'] item="service"}
											{translate key="common.fromUntil" from=$service['dateStart'] until=$service['dateEnd']}
											{if !$smarty.foreach.services.last}{translate key="common.commaListSeparator"}{/if}
										{/foreach}
									</span>
									<span>
										{$mastheadUser['user']->getFullName()|escape}
										{if $mastheadUser['user']->getData('orcid') && $mastheadUser['user']->hasVerifiedOrcid()}
											<a href="{$mastheadUser['user']->getData('orcid')|escape}" target="_blank" aria-label="{translate key="common.editorialHistory.page.orcidLink" name=$mastheadUser['user']->getFullName()|escape}">
												{$orcidIcon}
											</a>
										{/if}
									</span>
									{if !empty($mastheadUser['user']->getLocalizedData('affiliation'))}
										<span class="ammonite-breadcrumb-text"> — {$mastheadUser['user']->getLocalizedData('affiliation')|escape}</span>
									{/if}
								{/strip}
							</li>
						{/foreach}
					</ul>
				{/if}
			{/foreach}

			<div class="mt-4">
				{include file="frontend/components/editLink.tpl" page="management" op="settings" path="context" anchor="masthead" sectionTitleKey="common.editorialHistory"}
			</div>

			<div class="mt-4">
				{$currentContext->getLocalizedData('editorialHistory')}
			</div>
		</div>
	</div>
</div>

{include file="frontend/components/footer.tpl"}
