/*
 * Copyright 2016 Taylor Caldwell
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package net.rithms.riot.api.endpoints.static_data.methods;

import net.rithms.riot.api.ApiConfig;
import net.rithms.riot.api.UrlParameter;
import net.rithms.riot.api.endpoints.static_data.StaticDataApiMethod;
import net.rithms.riot.api.endpoints.static_data.constant.Locale;
import net.rithms.riot.api.endpoints.static_data.constant.SpellListTags;
import net.rithms.riot.api.endpoints.static_data.dto.SummonerSpellList;
import net.rithms.riot.constant.Platform;

public class GetDataSummonerSpellList extends StaticDataApiMethod {

	public GetDataSummonerSpellList(ApiConfig config, Platform platform, Locale locale, String version, boolean dataById, SpellListTags... tags) {
		super(config);
		setPlatform(platform);
		setReturnType(SummonerSpellList.class);
		setUrlBase(platform.getHost() + "/lol/static-data/v3/summoner-spells");
		if (locale != null) {
			add(new UrlParameter("locale", locale));
		}
		if (version != null) {
			add(new UrlParameter("version", version));
		}
		add(new UrlParameter("dataById", dataById));
		if (tags != null) {
			for (SpellListTags tag : tags) {
				add(new UrlParameter("tags", tag));
			}
		}
		addApiKeyParameter();
	}
}