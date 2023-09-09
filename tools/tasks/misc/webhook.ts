import { MessageBuilder, Webhook } from "discord-webhook-node";
import buildConfig from "../../buildConfig";
import { checkEnvironmentalVariables } from "../../util/util";

export default async function fireNightlyWebhook(): Promise<void> {
	checkEnvironmentalVariables(["DISCORD_WEBHOOK", "GITHUB_RUN_ID", "GITHUB_SHA"]);

	const webhook = new Webhook(process.env.DISCORD_WEBHOOK);

	if (buildConfig.nightlyHookName) {
		webhook.setUsername(buildConfig.nightlyHookName);
	}

	if (buildConfig.nightlyHookAvatar) {
		webhook.setAvatar(buildConfig.nightlyHookAvatar);
	}

	const link = `https://github.com/${process.env.GITHUB_REPOSITORY}/actions/runs/${process.env.GITHUB_RUN_ID}`;

	const embed = new MessageBuilder()
		.setTitle(`New snapshot available! (**${process.env.GITHUB_SHA.substr(0, 7)}**)`)
		.setDescription(`Click to [view on GitHub Actions](${link}).`);

	return webhook.send(embed);
}
