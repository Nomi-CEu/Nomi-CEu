import { sendDiscordWebhook } from "send-discord-webhook";
import buildConfig from "#buildConfig";

/**
 * Fires a webhook to discord about the new nightly.
 */
export default async function notifyDiscord(): Promise<void> {
	const actionsUrl = buildConfig.actionsRunsUrl + process.env.GITHUB_RUN_ID;
	const description = `View on [Nightly](${buildConfig.nightlyUrl}) or on [GitHub Actions](${actionsUrl}).`;

	await sendDiscordWebhook({
		url: process.env.DISCORD_WEBHOOK_URL ?? "",
		username: buildConfig.nightlyHookName,
		avatar_url: buildConfig.nightlyHookAvatar,
		embeds: [
			{
				title: `New nightly available! (${process.env.VERSION_NAME})`,
				description,
				color: 0x9973bd,
			},
		],
	});
}
