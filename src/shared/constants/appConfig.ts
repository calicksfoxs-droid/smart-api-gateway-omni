import pkg from "../../../package.json" with { type: "json" };

export const APP_CONFIG = {
  name: "Smart API Gateway Next",
  nameAr: "بوابة API الذكية",
  description: "بوابة عربية موحّدة وآمنة لنماذج الذكاء الاصطناعي المتعددة",
  version: pkg.version,
};

export const THEME_CONFIG = {
  storageKey: "theme",
  defaultTheme: "system",
};
