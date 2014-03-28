﻿#ifndef _BUILD_BASETHREAD_H_
#define _BUILD_BASETHREAD_H_

#include "../common/Types.h"

#if defined(WIN32) || defined(_WIN32_WCE)

#include "windows.h"
#include "winbase.h"

#else

#include <pthread.h>
#include <signal.h>
#include "time.h"

#endif

namespace NSThreads
{
	class CThreadDescriptor
	{
	public:
		CThreadDescriptor(){}
		virtual ~CThreadDescriptor(){}
	};

	static void Sleep(int nMilliseconds)
	{
#if defined(WIN32) || defined(_WIN32_WCE)
		::Sleep((DWORD)nMilliseconds);
#else
		struct timespec tim, tim2;
        tim.tv_sec = nMilliseconds / 1000;
        tim.tv_nsec = (nMilliseconds % 1000) * 1000000;

		::nanosleep(&tim , &tim2);
#endif
	}

	class CBaseThread
	{
	protected:
		CThreadDescriptor*	m_hThread;
		BOOL				m_bRunThread;
		BOOL				m_bSuspend;

		long				m_lError;
		long				m_lThreadPriority;

	public:
		CBaseThread()
		{
			m_hThread		= NULL;
			m_bRunThread	= FALSE;
			m_bSuspend		= FALSE;

			m_lError			= 0;
			m_lThreadPriority	= 0;
		}
		virtual ~CBaseThread()
		{
			Stop();
		}
	public:
		virtual void Start(long lPriority)
		{
			if (m_bRunThread)
				return;
			m_lError = 0;
			m_bSuspend = FALSE;

			m_hThread = new __native_thread();

            m_bRunThread = TRUE;
#if defined(WIN32) || defined(_WIN32_WCE)
			DWORD dwTemp;			
			((__native_thread*)m_hThread)->m_thread = CreateThread(NULL, 0, &__ThreadProc, (void*)this, 0, &dwTemp);
			SetThreadPriority(((__native_thread*)m_hThread)->m_thread, lPriority);
#else
            pthread_create(&((__native_thread*)m_hThread)->m_thread, 0, &__ThreadProc, (void*)this);
#endif
			m_lThreadPriority = lPriority;
		}
		virtual void Suspend()
		{
			m_bSuspend = TRUE;
		}
		virtual void Resume()
		{
			m_bSuspend = FALSE;
		}
		virtual void Stop()
		{
			if (!m_bRunThread)
				return;
			m_bRunThread = FALSE;
			
			Join();
			RELEASEOBJECT(m_hThread);
		}
		
		inline BOOL IsSuspended() { return m_bSuspend; }
		inline BOOL IsRunned() { return m_bRunThread; }
		inline long GetError() { return m_lError; }
		inline CThreadDescriptor* GetDescriptor() { return m_hThread; }
		inline int GetPriority() { return m_lThreadPriority; }
		
		virtual void CheckSuspend()
		{
			while (m_bSuspend && m_bRunThread)
				NSThreads::Sleep(10);
		}

	protected:
		virtual void Join()
		{
			if (NULL == m_hThread)
				return;

#if defined(WIN32) || defined(_WIN32_WCE)
			WaitForSingleObject(((__native_thread*)m_hThread)->m_thread, INFINITE);
#else
			pthread_join(((__native_thread*)m_hThread)->m_thread, 0);
#endif
		}
		virtual DWORD ThreadProc() = 0;

	private:

#if defined(WIN32) || defined(_WIN32_WCE)
		static DWORD WINAPI __ThreadProc(void* pv)
		{
			CBaseThread* pThis = (CBaseThread*)pv;
			return pThis->ThreadProc();
		}

		class __native_thread : public NSThreads::CThreadDescriptor
		{
			friend class CBaseThread;
		private:
			HANDLE m_thread;

		public:
			__native_thread() : CThreadDescriptor()
			{
				m_thread = NULL;
			}
			virtual ~__native_thread()
			{
				RELEASEHANDLE(m_thread);
			}
		};
#else
        static void* __ThreadProc(void* pv)
		{
			int old_thread_type;
			pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, &old_thread_type);

			CBaseThread* pThis = (CBaseThread*)pv;
			pThis->ThreadProc();	
		}
		class __native_thread : public NSThreads::CThreadDescriptor
		{
			friend class CBaseThread;
		private:
			pthread_t m_thread;

		public:
			__native_thread() : CThreadDescriptor()
			{
				m_thread = NULL;
			}
			virtual ~__native_thread()
			{
			}
		};
#endif
	};	
}

#endif // _BUILD_BASETHREAD_H_
