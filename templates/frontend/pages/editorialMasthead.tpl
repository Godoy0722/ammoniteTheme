{**
 * @file plugins/themes/ammoniteTheme/templates/frontend/pages/editorialMasthead.tpl
 *
 * Copyright (c) 2026 Simon Fraser University
 * Copyright (c) 2026 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display context's editorial masthead page.
 *}
{include file="frontend/components/header.tpl" pageTitle="common.editorialMasthead"}

<div class="max-w-xl-1200 mx-xl-auto main-content-layout">
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="common.editorialMasthead"}

	<div class="row mt-4">
		<div class="col-12 max-w-sm-900">
			<h1 class="ammonite-h1-text">
				{translate key="common.editorialMasthead"}
			</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-12 max-w-sm-900 ammonite-regular-text">
			{foreach from=$mastheadRoles item="mastheadRole"}
				{if array_key_exists($mastheadRole->id, $mastheadUsers)}
					<h2 class="ammonite-h2-text mt-4">{$mastheadRole->getLocalizedData('name')|escape}</h2>
					<ul class="list-unstyled">
						{foreach from=$mastheadUsers[$mastheadRole->id] item="mastheadUser"}
							<li class="mb-2">
								{strip}
									{if !empty($mastheadUser['dateStart'])}
										<span class="ammonite-breadcrumb-text">{translate key="common.fromUntil" from=$mastheadUser['dateStart'] until=""}</span>
									{/if}
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

			<p class="mt-4">
				{capture assign=editorialHistoryUrl}{url page="about" op="editorialHistory" router=\PKP\core\PKPApplication::ROUTE_PAGE}{/capture}
				{translate key="about.editorialMasthead.linkToEditorialHistory" url=$editorialHistoryUrl}
			</p>

			{if $reviewers->count()}
				<h2 class="ammonite-h2-text mt-5">{translate key="common.editorialMasthead.peerReviewers"}</h2>
				<p>{translate key="common.editorialMasthead.peerReviewers.description" year=$previousYear}</p>
				<ul class="list-unstyled">
					{foreach from=$reviewers item="reviewer"}
						<li class="mb-2">
							{strip}
								<span>
									{$reviewer->getFullName()|escape}
									{if $reviewer->getData('orcid') && $reviewer->hasVerifiedOrcid()}
										<a href="{$reviewer->getData('orcid')|escape}" target="_blank" aria-label="{translate key="common.editorialHistory.page.orcidLink" name=$reviewer->getFullName()|escape}">
											{$orcidIcon}
										</a>
									{/if}
								</span>
								{if !empty($reviewer->getLocalizedData('affiliation'))}
									<span class="ammonite-breadcrumb-text"> — {$reviewer->getLocalizedData('affiliation')|escape}</span>
								{/if}
							{/strip}
						</li>
					{/foreach}
				</ul>
			{/if}
		</div>
	</div>
</div>

{include file="frontend/components/footer.tpl"}
