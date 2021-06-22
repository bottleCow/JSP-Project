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

package net.rithms.riot.api;

import java.util.Arrays;
import java.util.Collection;
import java.util.concurrent.CopyOnWriteArrayList;

import net.rithms.riot.api.request.AsyncRequest;
import net.rithms.riot.api.request.Request;
import net.rithms.riot.api.request.RequestListener;
import net.rithms.riot.api.request.ratelimit.RateLimitException;

class EndpointManager {

	private final ApiConfig config;
	private final AsyncRequestPool pool;
	private final Collection<RequestListener> listeners = new CopyOnWriteArrayList<RequestListener>();

	EndpointManager(ApiConfig config) {
		this.config = config;
		pool = new AsyncRequestPool(config);
	}

	void addListeners(RequestListener... listeners) {
		this.listeners.addAll(Arrays.asList(listeners));
	}

	void awaitAll() throws InterruptedException {
		pool.awaitAll();
	}

	void callMethod(ApiMethod method) throws RateLimitException, RiotApiException {
		new Request(config, method);
	}

	<T> T callMethodAndReturnDto(ApiMethod method) throws RateLimitException, RiotApiException {
		Request request = new Request(config, method);
		return request.getDto();
	}

	AsyncRequest callMethodAsynchronously(ApiMethod method) {
		AsyncRequest request = new AsyncRequest(config, method);
		request.addListeners(listeners.toArray(new RequestListener[listeners.size()]));
		pool.add(request);
		return request;
	}

	int getPoolSize() {
		return pool.getPoolSize();
	}

	int getQueueSize() {
		return pool.getQueueSize();
	}

	void removeListeners(RequestListener... listeners) {
		this.listeners.removeAll(Arrays.asList(listeners));
	}
}