<?php

/**
 * @file plugins/themes/ammoniteTheme/classes/AnnouncementManager.php
 *
 * Copyright (c) 2026 Simon Fraser University
 * Copyright (c) 2026 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @class AnnouncementManager
 * @ingroup plugins_themes_ammonite
 *
 * @brief Helper to query announcements for the Ammonite theme.
 */

namespace APP\plugins\themes\ammoniteTheme\classes;

use APP\facades\Repo;
use Illuminate\Support\LazyCollection;

class AnnouncementManager
{
    public static function getStaticAnnouncements(int $contextId): LazyCollection
    {
        return Repo::announcement()
            ->getCollector()
            ->filterByContextIds([$contextId])
            ->filterByActive()
            ->getMany();
    }
}
