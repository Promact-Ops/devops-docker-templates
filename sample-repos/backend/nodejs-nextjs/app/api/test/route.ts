import { NextResponse } from 'next/server';

export async function GET() {
  return NextResponse.json({
    message: 'Promact Reusability Initiative - next.js build using docker',
    timestamp: new Date().toISOString(),
    status: 'success'
  });
}

export async function POST() {
  return NextResponse.json({
    message: 'Promact Reusability Initiative - next.js build using docker',
    method: 'POST',
    timestamp: new Date().toISOString(),
    status: 'success'
  });
}
