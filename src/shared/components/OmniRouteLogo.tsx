/** Smart API Gateway Next mark — a secure gateway around a routed data path. */
type OmniRouteLogoProps = {
  size?: number;
  className?: string;
};

export default function OmniRouteLogo({ size = 20, className = "" }: OmniRouteLogoProps) {
  return (
    <svg
      width={size}
      height={size}
      viewBox="0 0 32 32"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      className={className}
      aria-hidden="true"
    >
      <path
        d="M13 4.5 6.5 8.5v15l6.5 4M19 4.5l6.5 4v15l-6.5 4"
        stroke="currentColor"
        strokeWidth="3"
        strokeLinecap="round"
        strokeLinejoin="round"
      />
      <path
        d="m13 10 6 6-6 6"
        stroke="#22d3ee"
        strokeWidth="1.8"
        strokeLinecap="round"
        strokeLinejoin="round"
      />
      <circle cx="13" cy="10" r="2" fill="#22d3ee" />
      <circle cx="19" cy="16" r="2" fill="#22d3ee" />
      <circle cx="13" cy="22" r="2" fill="#22d3ee" />
    </svg>
  );
}
